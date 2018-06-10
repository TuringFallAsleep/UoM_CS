w(1) = -0.4;
w(2) = 0.4;

threshold = 0.2;
learningrate = 0.1;

%        x1  x2
data = [0.5 0.7;
	0.6 0.3;
	0.5 0.4];

target = [1 0 1]';


for iteration = 1:4

	for i = 1:3   % for each of three examples

		x = data(i,:);
		targ = target(i);

		activ = w(1)*x(1) + w(2)*x(2);

		if activ > threshold
			output=1;
		else
			output=0;
		end

		w(1) = w(1) + learningrate * (targ - output) * x(1);
		w(2) = w(2) + learningrate * (targ - output) * x(2);

		threshold = threshold + learningrate * (targ-output) * -1;

	end

	disp(['End of iteration ' num2str(iteration) ]);
	disp([ 'w(1)=' num2str(w(1)) ', w(2)=' num2str(w(2)) ]);
	for i=1:3
		x = data(i,:);
		activ = w(1)*x(1) + w(2)*x(2);
		disp(['Activation on example ' num2str(i) ' = ' num2str(activ) ]);
	end
end