<div align="center">

# ffmpeg-batch-downloader

This Bash script automates the process of downloading multiple videos from specified URLs using FFmpeg. The script reads video URLs from a text file and downloads each video using FFmpeg.

</div>

## Table of contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Customization](#customization)
- [License](#license)

## Prerequisites

[FFmpeg](https://github.com/FFmpeg/FFmpeg): Ensure that FFmpeg is installed on your system before running the script.

## Usage

1. Clone or download the script to your local machine.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:

```
chmod +x download.sh
```

4. Create a text file, urls.txt, and add the URLs of the videos you want to download, with each URL on a new line.

5. Edit the script to set the correct path for your input file:

```
input_file="/path/to/your/urls.txt"
```

6. Run the script:

```
./download.sh
```
The videos will be downloaded to the directory containing the script.

## Customization

Output Naming: The script currently extracts a portion of the URL to generate the output file name. Modify the extract_output_name function if you want a different naming scheme.

## License

</a>This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
You are free to use, copy, modify, distribute, and display the work, as well as make derivative works based on it, as long as you give attribution to the original author and share any derivative works under the same license. For more information about the license, please see the `LICENSE.md` file.
<div align="center">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></div>