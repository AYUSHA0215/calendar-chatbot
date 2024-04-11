enum UserType {
   AI
   User
}

class Message {
   user UserType
   content string
  
   display string @get(
       python#"
           if self.user == UserType.AI:
               return f"AI: {self.content}"
           else:
               return f"User: {self.content}"
       "#
   )
}

class Conversation {
   messages Message[]

   display string @get(
       python#"
           return "\n".join([m.display for m in self.messages])
       "#
   )
}