#!/bin/bash
tput clear
template(){
	echo "    __  ____       _    ____               _           __     "
        echo "   /  |/  (_)___  (_)  / __ \_________    (_)__  _____/ /_    "
        echo "  / /|_/ / / __ \/ /  / /_/ / ___/ __ \  / / _ \/ ___/ __/    "
        echo " / /  / / / / / / /  / ____/ /  / /_/ / / /  __/ /__/ /_      "
        echo "/_/  /_/_/_/ /_/_/  /_/   /_/   \____/_/ /\___/\___/\__/      "
        echo "                                    /___/                     "
        echo ""
}

basic_mode() {
    while true; do
        clear
	template
	echo ""
	echo -e "			\E[ \E[7m Basic Mode \E[m \E[m"
        echo "1. File Manipulation			2. Calendar"
	echo "3. Finding File and Directory		4. Multiplication table"
	read -p "Enter your choice: " choice
	case $choice in
		1) # File Manipulation
                	echo "File Manipulation Menu"
                	echo "1. List Files"
               		echo "2. Create a File"
                	echo "3. Delete a File"
                	echo "4. Back to Basic Mode Menu"
			echo "5. Exit the program"
                	read -p "Enter your choice: " file_choice
                	case $file_choice in
                    		1) ls ;;
                    		2) read -p "Enter file name: " filename && touch $filename && echo "File created: $filename" ;;
                    		3) read -p "Enter file name to delete: " filename && rm -i $filename && echo "File deleted: $filename" ;;
                    		4) continue ;;
				5) exit 0 ;;
                    		*) echo "Invalid choice. Please try again." ;;
                	esac
                	;;
		2)#Calendar Function
			echo "1. Show current calendar"
			echo "2. Get calendar"
			echo "3. Back to Basic Mode Menu"
			echo "4. Exit the program"
			read -p "Enter your choice: " cal_choice
			case $cal_choice in
				1) cal ;;
				2) read -p "Enter the month you want to search: " month
				   read -p "Enter the year you want to search:" year
				   cal $month $year;;
			   	3) continue ;;
				4) exit 0 ;;
				*) echo "Invalid choice. Please try again." ;;

			esac
			;;
		3) # Find files or directories in the filesystem without knowing the exact location
			read -p "Enter the filename or directory name to search: " search_term

			found_items=$(find / -name "$search_term" 2>/dev/null)
			if [ -n "$found_items" ]; then
    				echo -e "\nFound files or directories matching the search term:"
    				echo "$found_items"
			else
   				 echo -e "\nNo files or directories found matching the search term."
				fi

			;;
		4)#Mutipication table
			read -p "Enter Number:" Num
			echo "$Num"
			;;
		*) echo "Invalid choice. Please try again." ;;
        esac
        read -p "Press enter to continue..."
    done
}

# Main Menu
while true; do
    clear
    template
    echo "Main Menu"
    echo "1. Basic Mode"
    echo "2. Advanced Mode"
    echo "3. Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1) basic_mode ;;
        2) advanced_mode ;;
        3) echo "Exiting... Goodbye!" && exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    read -p "Press enter to continue..."
done
