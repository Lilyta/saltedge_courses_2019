
# 1. Write a method which will return all such numbers which are divisible by 7 but are not a multiple of 5, between given range (example: 1 and 100) (both included). 
# The numbers obtained should be printed in a comma-separated sequence on a single line.
# Input: 1, 100, Output: "7,14,21,28,42,49,56,63,77,84,91,98"

def check_num(a, b)
	print "The first number must be greater than the second one. Please enter a new set of numbers" if a > b
	x = (a..b).to_a
	result = x.select { |n| (n % 7 == 0) && (n % 5 != 0) }
    print result
end

# 2. Write a method which can compute the factorial of a given number. Input: 8, Output: 40320

def factorial(n)
	print "Enter a number:"
	n = gets.chomp
	print (1..n).inject(:*)
end

def fact(x)
	if x == 0
		return 1
	return x * fact(x - 1)
x = int(raw_input())
print fact(x)


# 3. Write a program which accepts a sequence of comma-separated numbers from console and returns a list which contains every number.
# Input: 34,67,55,33,12,98, Output: ['34', '67', '55', '33', '12', '98']

def sep_number(s)
	print "Enter a string of comma-separated numbers:"
	s = gets.chomp
	return s.split
end

# 4. Write a program that accepts a comma separated sequence of words as input and prints the words in a comma-separated sequence after sorting them alphabetically.
# Input: without,hello,bag,world. Output: bag,hello,without,world

def sorted_words(str)
	print "Enter a string of comma-separated words:"
	str = gets.chomp
	return str.split(",").sort
end


# 5. Write a program that accepts a sentence and calculate the number of upper case letters and lower case letters.
# Input: Hello world! Output: UPPER CASE 1, LOWER CASE 9

def letters(str)
	print "Please enter a string:"
	str = gets.delete(" ").split(//)
	upc = str.select { |ch| ch == ch.upcase }
	lwc = str.select { |ch| ch == ch.downcase }
	return "UPPER CASE: #{upc.size} LOWER CASE: #{lwc.size}"
end