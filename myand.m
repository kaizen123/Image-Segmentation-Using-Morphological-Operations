function newIm = myand(im, binIm, impath)

if(impath == 'coast1.PNG')
	% coast 1 için kırpılacak en koyu iskele bile 100 un ustunde.
	%~ r+g+b 300 un altındaysa direk alıcaz. değilse, eger binIm da o piksel 1 se alıcaz.
		[x,y,z] = size(im);
		newIm = im;
		for i = 1:x
			for j = 1:y
				if((im(i, j, 1) + im(i, j, 2) + im(i, j, 3)) > 250) %jenı ımageı dırek al
					if(binIm(i, j) == 1)
						newIm(i, j, :) = im(i, j, :);
					else %sacma sapan bi renge boya
						newIm(i, j, 1) = 241;
						newIm(i, j, 2) = 247;
						newIm(i, j, 3) = 129;
					end
				
				end
			end
		end
end

if(impath == 'coast2.PNG')
		[x,y,z] = size(im);
		newIm = im;
		for i = 1:x
			for j = 1:y
				if((im(i, j, 1) + im(i, j, 2) + im(i, j, 3)) > 250) %jenı ımageı dırek al
					if(binIm(i, j) == 1)
						newIm(i, j, :) = im(i, j, :);
					else %sacma sapan bi renge boya
						newIm(i, j, 1) = 241;
						newIm(i, j, 2) = 247;
						newIm(i, j, 3) = 129;
					end
				
				end
			end
		end
end

if(impath == 'coast3.PNG')
		[x,y,z] = size(im);
		newIm = im;
		for i = 1:x
			for j = 1:y
				if((im(i, j, 1) + im(i, j, 2) + im(i, j, 3)) > 250) %jenı ımageı dırek al
					if(binIm(i, j) == 1)
						newIm(i, j, :) = im(i, j, :);
					else %sacma sapan bi renge boya
						newIm(i, j, 1) = 241;
						newIm(i, j, 2) = 247;
						newIm(i, j, 3) = 129;
					end
				
				end
			end
		end
end
