-module(tut9).
-export([test_if/2]).

test_if(A,B)-> 
	if
		A == 5 ->
			io:format("A =5~n", []),
			a_equals_5;
		B == 6 ->
			io:format("B =6~n", []),
			b_equals_6;
		A == 2,B == 3 ->            %i.e. A equals2 and B
			equals3 
			io:format("A ==2,B ==3~n",[]),
			a_equals_2_b_equals_3;
		A == 1 ; B ==7 ->            %i.e. A equals1 orB equals	7
			io:format("A ==1 ;B == 7~n",[]),
			a_equals_1_or_b_equals_7 
	end. 

% 注意 ; 这里是顺序执行



-export([convert_length/1]). 

convert_length(Length)->
	case Length of
		{centimeter, X}-> 
			{inch, X / 2.54};
		{inch, Y}-> 
			{centimeter, Y * 2.54}
	end.

% case语句
% 调用 tut9:convert_length({inch,6}).

-export([month_length/2]).
month_length(Year,Month)-> 
	%%All years divisibleby400areleap
	%% Years divisibleby100arenotleap(exceptthe400rule above)
	%% Years divisibleby4 are leap (except the 100 ruleabove) 
	Leap = if
		trunc(Year/ 400) *400 == Year -> 
			leap;
		trunc(Year/ 100) *100 == Year -> 
			not_leap;
		trunc(Year/ 4) *4 == Year -> 
			leap;
		true -> 
			not_leap 
	end,
	case Month of
		sep -> 30;
		apr -> 30;
		jun -> 30;
		nov -> 30;
		feb when Leap == leap-> 29;
		feb -> 28;
		jan -> 31;
		mar -> 31;
		may-> 31;
		jul -> 31;
		aug -> 31;
		oct -> 31;
		dec -> 31
	end.

% 使用内建函数 trunc，去掉小数部分