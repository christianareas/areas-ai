# Dependencies.
from dotenv import load_dotenv
import os
import openai

# Load the environment variables from .env.
load_dotenv()

# Set the OpenAI API key.
openai.api_key = os.getenv("OPENAI_API_KEY")


