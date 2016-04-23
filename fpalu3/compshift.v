module compshift(a_exp,b_exp,a_sign,b_sign,a_mantissa,b_mantissa)
input[7:0]a_exp,b_exp;
input a_sign,b_sign;
input[22:0]a_mantissa,b_mantissa;
if(a_exp==b_exp)
begin
e1 = a_exp;
e2 = b_exp;
aval = a_mantissa;
bval = b_mantissa;
end
elseif(a_exp<b_exp)
begin
diff = b_exp-a_exp;
e1 = a_exp+diff;
e2 = b_exp;
aval = a_mantissa>>diff;
bval = b_mantissa;
end
else(a_exp>b_exp)
begin
diff = a_exp-b_exp;
bval = b_mantissa>>diff;
end 