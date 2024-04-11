enum Intent {
    BookMeeting
    AvaiabilityQuery
    SetReminder
}

function ClassifyIntent{
    input (query: string)
    output Intent[]

    default_impl simple
}

impl<llm, ClassifyIntent> simple {
  client Main

  prompt #"
    Given the question, which of the intents is the user attempting to do?

    Question:
    ```
    {#input.query}
    ```

    {#print_enum(Intent)}

    Output JSON: {#print_type(output)}

    JSON:
  "#

}