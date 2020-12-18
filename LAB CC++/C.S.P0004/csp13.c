int main()
{
int summation(arr) {
     int arr[MAX_SIZE];     
int i, n, sum=0;
for(i=0; i<n; i++)     
{         
scanf("%d", &arr[i]);     
}      
for(i=0; i<n; i++)     {         sum = sum + arr[i];     }       return sum; }
int length(arr){
for(i=0; i<n; i++)     {         sum = sum + 1;
     }       
return sum; 
}
int llsq(int x[], int y[],xt[])
{
     x = m.x
        y = m.y
        # Summatation of x*y
        xy = x .* y
        sxy = sum(xy)
        # N
        n = length(x)
        # Summatation of x^2
        x2 = x .^ 2
        sx2 = sum(x2)
        # Summatation of x and y
        sx = sum(x)
        sy = sum(y)
        # Calculate the slope:
        slope = ((n*sxy) - (sx * sy)) / ((n * sx2) - (sx)^2)
        # Calculate the y intercept
        b = (sy - (slope*sx)) / n
        # Empty prediction list:
        y_pred = []
        for i in xt
            pred = (slope*i)+b
            append!(y_pred,pred)
    return y_pred;
}
}
