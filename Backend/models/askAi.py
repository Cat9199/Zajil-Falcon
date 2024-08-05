
from ai71 import AI71

AI71_API_KEY = "api71-api-0aecf763-d29b-4023-b1b9-f843cc39b7cc"
client = AI71(AI71_API_KEY)

def chat_with_ai(messages):
    try:
        response = client.chat.completions.create(
            model="tiiuae/falcon-180B-chat",
            messages=messages
        )
        content = response.choices[0].message.content
        messages.append({"role": "assistant", "content": content})
        print(f"AI71: {content}")
        print(f"Messages: {messages}")
        return content, messages
    except Exception as e:
        print(f"An error occurred: {e}")
        return "Error processing your request", messages
