% exercise 2
factorial(15)

% exercise 3
A = [16 3 2 13; 5 10 11 8; 9 6 7 12; 4 15 14 1]
B = eye(4)

% exercise 4
sum(A(:,3))

% exercise 5
A(:,[1,3])

% exercise 6
% column sum
sum(A)

% row sum
sum(A')

% exercise 7
A*B
A.*B

% exercise 8
sum(sum(A>10)')

% exercise 9
x = log([1:100]);
plot(x)

% exercise 10
for i=1:4
    for j=1:4
        B(i,j) = 1/ A(i,j);
    end
end
B

B = 1./ A


