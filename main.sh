#!/bin/bash

add_book() {
    echo "Enter book details:"
    read -p "Title: " title
    read -p "Author: " author
    echo "$title|$author" >> library.txt
    echo "Book added successfully!"
}

remove_book() {
    echo "Enter the title of the book to remove:"
    read -p "Title: " title
    if grep -q "$title" library.txt; then
        sed -i "/$title/d" library.txt
        echo "Book removed successfully!"
    else
        echo "Book not found!"
    fi
}

list_books() {
    echo "List of books:"
    cat library.txt
}

search_book() {
    echo "Enter the title of the book to search for:"
    read -p "Title: " title
    if grep -q "$title" library.txt; then
        echo "Book found:"
        grep "$title" library.txt
    else
        echo "Book not found!"
    fi
}

while true; do
    echo "Library Management System"
    echo "1. Add a book"
    echo "2. Remove a book"
    echo "3. List all books"
    echo "4. Search for a book"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)  add_book ;;
        2)  remove_book ;;
        3)  list_books ;;
        4)  search_book ;;
        5)  echo "Exiting..."; break ;;
        *)  echo "Invalid choice";;
    esac
done
