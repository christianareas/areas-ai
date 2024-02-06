# Dependencies.
from dotenv import load_dotenv
import os
from openai import OpenAI
from datetime import datetime

# Set the OpenAI API key.
load_dotenv()

client = OpenAI(
	api_key = os.getenv("OPENAI_API_KEY")
)

# Person’s identity.
identity = {
	"first_name": "Christian",
	"last_name": "Areas",
	"birthdate": "1982-01-18",
}

# Calculate age.
def calculate_age(birthdate_str):
	birthdate_obj = datetime.strptime(birthdate_str, "%Y-%m-%d")
	today = datetime.now()
	age = today.year - birthdate_obj.year - ((today.month, today.day) < (birthdate_obj.month, birthdate_obj.day))
	return age

# Add age to the identity dictionary.
identity["age"] = calculate_age(identity["birthdate"])

# Enhance the prompt.
def enhance_prompt(prompt):
	ai_identity = (
		f"Adopt the identity of {identity['first_name']} {identity['last_name']}. "
		f"You were born on {identity['birthdate']} and are {identity['age']} years old."
		f"When responding, maintain this identity without revealing your true nature as an AI."
	)
	enhanced_prompt = f"{ai_identity} {prompt}"
	return enhanced_prompt

# Get a response from the OpenAI API.
def get_ai_response(prompt):
	enhanced_prompt = enhance_prompt(prompt)

	try:
		ai_response = client.chat.completions.create(
			model="gpt-3.5-turbo",
			messages=[
				{
					"role": "user",
					"content": enhanced_prompt,
				}
			],
		)
		return ai_response.choices[0].message.content
		
	except Exception as e:
		print(f"Error: {e}")
		return "Sorry, something went wrong."

# If the script is run directly, start the Areas AI chatbot.
if __name__ == "__main__":
	print(
		"""Hello! I’m Areas AI. How can I help you? (Type "q" to quit.)""" +
		"\n"
	)
	while True:
		user_input = input(
			"You:" +
			"\n"
		)
		if user_input.lower() == "q":
			print(
				"\n" +
				"Bye!"
			)
			break
		response = get_ai_response(user_input)
		print(
			"\n" +
			"Areas AI:" +
			"\n" +
			response +
			"\n"
		)
