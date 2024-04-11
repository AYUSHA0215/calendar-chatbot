function ExtractMeetingRequestInfo {
    input (convo:Conversation, now: string) 
    output MeetingRequest

    default_impl simple
}

python#"
    from datetime import datetime
    from baml_client import baml

    def my_function(query: str) -> MeetingRequest:
        return baml.ExtractMeetingRequestInfo(
            query=query,
            now=datetime.now()
        )
"#

class MeetingRequest {
    attendees Attendee[]
    topic string
    time string @alias(when)
    @description(#"
        Either an exact time, or a relative time. Use ISO 8601 Duration Format
        when specifying a relative time (e.g. P1D for 1 day from now).
    "#)
}

class Attendee {
    name string
    email string
}

impl<llm, ExtractMeetingRequestInfo> simple {
    client Main

    prompt #"
        Given a user is trying to schedule a meeting, extract the relevant
        information from the query.

        Context:
        ```
        Today is {#input.now}
        ```

        Conversation:
        ```
        {#input.convo.display}
        ```

        Output JSON:
        {#print_type(output)}

        JSON:
    "#
}

class MeetingRequestPartial {
    time string? @alias(when)
    @description(#"
        Either an exact time, or a relative time. Use ISO 8601 Duration Format
        when specifying a relative time (e.g. P1D for 1 day from now).
    "#)
    duration string? @description(#"
        Use a ISO 8601 Duration Format (e.g. 1h for 1 hour).
    "#)
    attendees string[] @description(#"
        Names or preferably emails of attendees.
    "#)
    topic string?
    @description(#"
        What is the topic of the meeting?
    "#)
}

function ExtractMeetingRequestInfoPartial {
    input (convo:Conversation, now: string) 
    output MeetingRequestPartial
}

impl<llm, ExtractMeetingRequestInfoPartial> v1 {
    client Main

    // We can use the same prompt as before.
    prompt #"
        Given a user is trying to schedule a meeting, extract the relevant
        information from the query.

        Context:
        ```
        Today is {#input.now}
        ```

        Conversation:
        ```
        {#input.convo.display}
        ```

        Output JSON:
        {#print_type(output)}

        JSON:
    "#
}