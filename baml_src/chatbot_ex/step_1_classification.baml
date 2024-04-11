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

// Now we implement the function, using an llm.
impl<llm, ClassifyIntent> simple {
  // This is the name of the client, which is used to execute this impl.
  // See ./clients.baml file for more details.
  client Main

  prompt #"
    Given the question, which of the intents is the user attempting to do?

    Question:
    ```
    {#input.query}{// you can refer to the query value in the prompt here//}
    ```

    {#print_enum(Intent)}{// we use printers to print out each enum value automatically. //}

    Output JSON: {#print_type(output)}{// we use printers to print out the output type automatically. //}

    JSON:
  "#

  // Note, even though an LLM returns a string, we parse it into our array of Intents
  // automatically.
}