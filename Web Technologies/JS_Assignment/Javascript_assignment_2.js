//Question 1 

1)With example illustrate variable and function closure in javascript.

-->
function fun1(x)
{
  var p=10;
  return function(k)
  {
    return (k+p)*x(k,1);
  }
}

var add= fun1(function(x,y){return x+y;});

add(10);

=====================================================
//Question 2

2) Write a javascript function named reverse which takes a string argument and returns the
reversed string.

--->
function reverse(str)
{
  var p=" ";
  for(var i=str.length -1; i>=0; i--)
    {
     p+=str.charAt(i);  
    }
  return p;
}

reverse("Pratima");

=====================================================

//Question 3

3)Given a javascript array of objects having a radius property as shown [{radius: 5}, {radius: 9},
{radius: 2}] , write a comparator function to sort it.


--->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JS_Assignment_11</title>
</head>
<body>
    <script>
        var circleArr = [
            {radius: 5},
            {radius: 9},
            {radius: 2}
        ];

        circleArr.sort(function (a, b)
            {
                return a.radius - b.radius;
            });
            
        // run the above code directly on console.
    </script>
</body>
</html>






=====================================================

// Question 4

4)Write a Javascript program to sort elements of an array using sorting algorithm

var arr=[5,2,7,1,9,3];



function sort(arr)
{
  for(var i=0;i<arr.length;i++)
    {
      for(var j=i+1;j<arr.length;j++)
        {
        	if(arr[i]>arr[j])
          {
            var temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
          }
        }
    }
 return arr;
}

sort(arr);

=====================================================

//Question 5

5)Write a javascript function named length_of_array , which takes an array as argument and
returns the number of elements in that array (as opposed to what is given by the length
property of the array). Remember undefined can also be an element if it is explicitly set at some
index, e.g. x[5] = undefined; . This undefined should be counted, but elements which are not
present in the array (as arrays can be sparse), should not be counted.

--->

var arr=[2,5,6,8,5,1];
arr[3]=undefined;


arr.sun="sunday";

function length_of_arr(arr)
{
  var count=0;
 	 for(var i in arr)
    {
			count++;
    }
  return count;
}

var k = length_of_arr(arr);
console.log("Array length is "+k);