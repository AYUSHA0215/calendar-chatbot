client<llm> GPT4 {
  provider baml-openai-chat
  
  options {
    // Options are directly passed to the OpenAI client.
    // So you can add any of the params like:
    model gpt-4-1106-preview
    api_key env.OPENAI_API_KEY

    // By default, the temperature is 0
    temperature 0.1
  }
}

// We get that OPENAI GPT4 may be unreliable, so you can use fallbacks.
// This will try to use GPT4, and if it fails, it will use GPT35.
client<llm> Main {
  provider baml-fallback
  options {
    // First try GPT4 client, if it fails, try GPT35 client.
    strategy [
      GPT4,
      GPT35
    ]
  }
}


client<llm> GPT35 {
  provider baml-openai-chat
  options {
    model gpt-3.5-turbo
    // If you had your own environment variable, you could do this:
    // You could use any environment variable here
    api_key env.OPENAI_API_KEY
  }  
}

client<llm> GPT35_YES_NO {
  provider baml-openai-chat
  options {
    model gpt-3.5-turbo
    api_key env.OPENAI_API_KEY
    logit_bias {
      // When using logit bias baml providers can automatically convert the string to a token using the appropriate tokenizer.
      " yes" 100
      " no" 100
    }
  }
}