#!/bin/bash

tests_passed=0
tests=8

# Test hello world
if [ "$(curl -s http://localhost:8080)" == "hello world" ]; then
	echo "Hello World Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Hello World Test Failed";
fi

# Test reset
if [ "$(curl -s http://localhost:8080/reset)" == "state reset" ]; then
	echo "Reset Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Reset Test Failed";
fi

# Get Price
if [ "$(curl -s http://localhost:8080/price)" == "0" ]; then
	echo "Get Price (0) Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Get Price (0) Test Failed";
fi

# Book Order
if [ "$(curl -s http://localhost:8080/order/1)" == "book 1 ordered" ]; then
	echo "Book Order Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Book Order Test Failed";
fi

# Get Price
if [ "$(curl -s http://localhost:8080/price)" == "8" ]; then
	echo "Get Price (1) Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Get Price (1) Test Failed";
fi

# Book order 2
if [ "$(curl -s http://localhost:8080/order/2)" == "book 2 ordered" ]; then
	echo "book order (2) test passed";
	tests_passed=$((tests_passed+1))
else
	echo "book order 2 test failed";
fi

# Get Price
if [ "$(curl -s http://localhost:8080/price)" == "15.2" ]; then
	echo "Get Price (2) Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Get Price (2) Test Failed";
fi


curl -s http://localhost:8080/reset    > /dev/null
curl -s http://localhost:8080/order/1  > /dev/null
curl -s http://localhost:8080/order/1  > /dev/null

# Get Price
if [ "$(curl -s http://localhost:8080/price)" == "16" ]; then
	echo "Get Price (2) Test Passed";
	tests_passed=$((tests_passed+1))
else
	echo "Get Price (2) Test Failed";
fi

curl -s http://localhost:8080/reset > /dev/null


echo "";
echo "$tests_passed / $tests Tests passed";
