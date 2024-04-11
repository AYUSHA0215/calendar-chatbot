function GetNextQuestion {
    input MeetingRequestPartial
    output Validation
}

class Validation {
    requirements_complete bool
    follow_up_question string?
}

impl<llm, GetNextQuestion> v1 {
    client Main

    override Validation {
        requirements_complete @alias(complete) @description(#"
            True if there is enough information filled out in the input. I don't need any more fields.
        "#)
        follow_up_question @description(#"
            If not complete, what question should be asked next? Try to gather as much information as possible in one question as this is answered in an email.
        "#)
    }

    prompt #"
    Given the partial requirements, are the requirements complete?

    Input:
    ```

    {#input}
    ```

    Output JSON:
    {#print_type(output)}

    JSON: 
    "#
}