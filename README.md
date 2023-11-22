![Weather Image](image.jpg)

# Weather Information Bash Script

This Bash script fetches current weather information using the [WeatherAPI](https://www.weatherapi.com/) and displays relevant details in the terminal.

## Features

- Fetches weather information for a specified city using the WeatherAPI.
- Checks for internet connectivity before making the API request.
- Displays current weather details, including temperature, wind speed, humidity, and more.
- Can be run automatically on machine startup.

## Getting Started

### Prerequisites

- Bash (Linux/Unix-like environment)
- [jq](https://stedolan.github.io/jq/) - A lightweight and flexible command-line JSON processor.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/hima890/weatherInformation_bash.git
   ```

2. Move into the project directory:

   ```bash
   cd weatherInformation_bash
   ```

3. Make the script executable:

   ```bash
   chmod +x main.sh
   ```

### Usage

1. Configure your API key and city in the `config.txt` file:

   ```bash
   # Using Free api from "https://www.weatherapi.com/"

   # Add the API key to get access to the data
   API_KEY="<Write-your-key-here>"
   # Set the option for air quality
   API_OP="no"
   # Set the target city
   City="<Write-your-city-here>"
   ```

2. Run the script:

   ```bash
   ./main.sh
   ```

   This will display the current weather information for the specified city.

### Automating Script Execution on Startup

To run the script automatically every time you start your machine, follow the instructions in the [Autostart section](#autostart) below.

## Autostart

To make the script run automatically on machine startup, add the following line to your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`, or equivalent):

```bash
export PATH="$PATH:/path/to/weatherInformation_bash"
```

Replace `/path/to/weatherInformation_bash` with the actual path to the project directory.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```

Please note that you should replace placeholders such as `<Write-your-key-here>` and `<Write-your-city-here>` with actual values in your `config.txt` file. Additionally, modify the installation and usage instructions based on the specific requirements of your project.
