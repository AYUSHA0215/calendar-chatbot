enum Category {
    Refund
    CancelOrder
    TechnicalSupport
    AccountIssue
    Question
}

function ClassifyMessage { 
  input (message: string, message_date: string)
  output Category[]
}

impl<llm, ClassifyMessage> level1 {
  client Main
  prompt #"
    Classify the following INPUT into following:
    {#print_enum(Category)}

    INPUT
    ---
    date: {#input.message_date}
    message: {#input.message}
    ---

    JSON array of categories that match:
  "#
}
