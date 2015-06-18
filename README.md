# Software versions:
* Ruby: 2.1.3p242
* Rack: 1.6.1
* Grape: 0.11.0

# Assumptions / Restrictions made for the input data
* Dummy data that were used for this project are stored in /data folder.
* All fields don't contain any blank characters (e.g. "Von Matterhorn" => "Von_Matterhorn" or "Light Blue" => "Light-Blue")
* Date of birth is always entered in "M/D/YYYY" format.
* The input files are .txt files.
* Each record has all the fields present, and they are all in the correct fields.
* Each record takes up 1 line.

# To run the program
>
> ruby parser.rb [file_name].txt
>