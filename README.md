<div align="center">

# ffmpeg-batch-downloader

<a href="https://www.gnu.org/software/bash/">
    <img alt="Shell Script" src="https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white" /></a>
<a href="https://www.apple.com/macos/">
    <img alt="macOS" src="https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0" /></a>
<a href="https://kernel.org">
    <img alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" /></a>
<br>
<br>

This Bash script automates the process of downloading multiple videos from specified URLs using FFmpeg. The script reads video URLs from a text file and downloads each video using FFmpeg.

The optional extractURLs.sh script extracts URLs from an html source file into an output file.

The two scripts work on macOS. They should also work on Linux (untested).

</div>

<details>
<summary>Table of Contents</summary>

- [Prerequisites](#prerequisites)
- [Usage](#usage)
    - [Extracting URLs](#extracting-urls)
    - [Downloading Videos](#downloading-videos)
- [Customization](#customization)
- [License](#license)
</details>

## Prerequisites

[FFmpeg](https://github.com/FFmpeg/FFmpeg): Ensure that FFmpeg is installed on your system before running the script.

## Usage

### Extracting URLs

This part is optional. If you already have the URLs of the videos you want to download, continue to Downloading Videos.

1. Clone or download the script to your local machine.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:

```
chmod +x extractURLs.sh
```

4. Create a text file: `html.txt`, and copy the html source code containing the links into the file. Create an empty text file: `urls.txt`.

5. Edit the script to set the correct path for your input and output file:

```
input_file="/path/to/your/html.txt"
output_file="/path/to/your/urls.txt"
```

6. Run the script:

```
./extractURLs.sh
```
The links will be written to the urls.txt file.

### Downloading Videos

1. Clone or download the script to your local machine.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:

```
chmod +x download.sh
```

4. Only if you skipped Extracting URLs: Create a text file: `urls.txt`, and add the URLs of the videos you want to download, with each URL on a new line.

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

Change how URLs are filtered in extractURLs.sh: The script currently extracts only links that follow after `HLSUrl":`. Modify the awk part of the script if your html source file is different. Here's a breakdown of the `awk` command as it is implemented at the moment:

```
awk -F'HLSUrl":' '{for (i=2; i<=NF; i++) print $i}' "$input_file" | awk -F'"' '{print $2}' | sort -u > "$output_file"
```

- `-F'HLSUrl":'`: This option sets the field separator to 'HLSUrl":'. It tells `awk` to split each line of input into fields based on the specified separator.

- `'{for (i=2; i<=NF; i++) print $I}'`: This part of the `awk` command is a loop (`for` loop) that iterates over the fields from the second field (`i=2`) to the last field (`i<=NF`). It prints each field on a new line. This effectively extracts the content that comes after "HLSUrl":.

- `awk -F'"' '{print $2}'`: This is a second `awk` command in the pipeline. It sets the field separator to double quotes (`-F'"'`) and prints the second field. This extracts the actual URL between the double quotes.

- `sort -u`: This command sorts the extracted URLs (`-u` option ensures unique entries) in ascending order.

- `> "$output_file"`: Redirects the sorted and unique URLs to the specified output file.

---

Output Naming in download.sh: The script currently extracts a portion of the URL to generate the output file name. Modify the extract_output_name function if you want a different naming scheme.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). You are free to use, modify, and distribute this software for both personal and commercial purposes as long as you give attribution to the original author. For more information about the license, please see the `LICENSE` file.
