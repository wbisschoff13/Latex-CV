# Use the official TeX Live image as the base image
FROM texlive/texlive:latest

# install github-cli
RUN apt-get update && apt-get install -y gh

# Set the working directory to /dev
WORKDIR /dev

# Copy the .tex file into the container
COPY . .

# Compile the .tex file using LuaLaTeX
CMD ["lualatex", "W_Bisschoff_CV.tex"]
