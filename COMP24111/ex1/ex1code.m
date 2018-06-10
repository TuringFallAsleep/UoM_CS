%EX 1
demos

%EX 2
help factorial
factorial(15)

%EX 3
A = [16 3 2 13; 5 10 11 8; 9 6 7 12; 4 15 14 1]
B = eye(4)

%EX 4
sum(A(:,3))

%EX 5
A(:,1:2:3)

%EX 6
sum(A)
sum(A')
sum(A*eye(4))
sum(A'*eye(4))

%EX 7
A*B
A.*B

%EX 8
sum(sum(A>10,1))

%EX 9
x=1:100;
y=log(x);
plot(x,y)

%EX 10
for i=1:4
    for j=1:4
        B(i,j)=1/A(i,j);
    end
end
sum(B)

sum(1./A)
