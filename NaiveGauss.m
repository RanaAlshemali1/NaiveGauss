n=3;
a= zeros(n,n);
b=zeros(n,1);
for i=1:n
    for j=1:n
        a(i,j)= i+j;
    end
    b(i)= i+1;
end
%a = [1 -3 1; 2 -8 8; -6 3 -15]
%b = [4; -2; 9] 
a
b
x= zeros(n,1);
x= GaussianElimination(n,a,b,x)
function x = GaussianElimination(n,a,b,x)
xmult=0;
sum=0;
for k=1:n-1
    for i= k+1:n
        xmult= a(i,k)/a(k,k);

        for j=k:n
            a(i,j)=  a(i,j)- xmult*a(k,j) ;
        end
        b(i)= b(i)- xmult*b(k);
    end
end

if b(n) == 0 || a(n,n)==0
    x(n)=0;
else
x(n)=b(n)/a(n,n);
end
for i=n-1:-1:1
    sum= b(i);
    for j=i+1:n
        sum = sum-a(i,j)*x(j);
    end
    x(i)= sum/a(i,i);
end

end

