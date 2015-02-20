function newIm = morph(imPath, method)
	imPath;
	A = imread(imPath);	
	
	%~ b1 = im2bw(im1);
%~ cc1 = bwconncomp(~b1); 
%~ num1 = cellfun(@numel, cc1.PixelIdxList);
%~ [biggest1, idx1] = max(num1);
%~ temp1 = zeros(887,995);
%~ temp1(cc1.PixelIdxList{idx1}) = 1;
%~ figure : imshow(temp1);


	
	if (imPath == 'coast1.PNG')
		a = im2bw(A);	
		
		cc = bwconncomp(~a);
		n = cellfun(@numel, cc.PixelIdxList);
		[big, idx] = max(n);
		b = zeros(887, 995);
		b(cc.PixelIdxList{idx}) = 1;
		b = ~b;
		
		%~ iskeleler yok, yatlar var (hala dalga kıran da var)
		
		se = strel('line', 5, 90); %yatayları kaybediyo
		g = imerode(b, se);
		g = imdilate(g, se);
		%~ bunu yaptıktan sonra düzgün boyanmış bi output almıstım. bu 2. dilatten once baska erodelar da yapmak gerekeblır 
		
		%aslında se = strel('line', 5, 170); de iskeleleri çok güzel kaybediyo
		se = strel('line', 5, 170); %düşeyleri kaybedio
		g = imerode(g, se);
		g = imdilate(g, se);
		
		
		%~ figure; imshow(g);
		
		se = strel('disk', 20);
		t = imerode(b, se);
		t = imdilate(t, se);
		%~ figure; imshow(t);
		
		
		%~ yat, iskele gıdıyo dalga kıran kalıyo
		se = strel('disk', 15);
		k = imerode(b, se);
		k = imdilate(k, se);
		%~ figure; imshow((k - t));
		%~ figure; imshow(g);
		%~ figure; imshow(g - (k - t));
		
		m = g - (k - t);
		se = strel('line', 7, 45); 
		m = imerode(m, se);
		se = strel('line', 7, 90); 
		m = imerode(m, se);
		se = strel('line', 7, 135); 
		m = imerode(m, se);
		se = strel('line', 7, 0); 
		m = imerode(m, se);
		m = imdilate(m, se);
		se = strel('line', 7, 45); 
		m = imdilate(m, se);
		se = strel('line', 7, 90); 
		m = imdilate(m, se);
		se = strel('line', 7, 135); 
		m = imdilate(m, se);
		
		%~ figure; imshow(m);
		
				%~ figure; imshow((b - ( (b-(~g)) - t)));
				%~ figure; imshow(g);
				%~ figure; imshow(t);
				%~ figure; imshow((b - ( (b-(~g)) - t)) + (m - t));
				%~ figure; imshow((m-t));
				%~ figure; imshow((b - ( (b-(~m)) - t)));

		
		if(method == 1) % iskele ve dalgakıranlar
			newIm = myand(A, g, imPath);
			newIm = myand(newIm, ~(m-t), imPath);
		%~ asıl resımden g yi cıkar oyle boya
			
		else % yatlar
			%~ newIm = myand(A, (b - ( (b-(~g)) - t + m - t) ), imPath);	
			newIm = myand(A, ((b - ( (b-(~g)) - t)) + (m - t)), imPath);	
		%~ direk g li yere boya
			
		end		
	end
	
	if (imPath == 'coast2.PNG')
		a = im2bw(A);
		
		cc = bwconncomp(~a);
		n = cellfun(@numel, cc.PixelIdxList);
		[big, idx] = max(n);
		b = zeros(959, 1445);
		b(cc.PixelIdxList{idx}) = 1;
		b = ~b;
		
		%~ iskeleler yok yatlar var
		
		se = strel('line', 5, 10);
		g = imerode(b, se);
		g = imerode(g, se);
		g = imerode(g, se);
		
		g = imdilate(g, se);
		g = imdilate(g, se);
		g = imdilate(g, se);
		g = imdilate(g, se);
		se = strel('line', 5, 90);
		g = imdilate(g, se);
		g = imdilate(g, se);
		g = imdilate(g, se);
		
		
		se = strel('disk', 20);
		t = imerode(b, se);
		t = imdilate(t, se);
		
		if(method == 1) % iskele ve dalgakıranlar
			%~ figure;imshow(b);
			%~ figure;imshow(~b);
			%~ figure;imshow(g);
			%~ figure;imshow(b-g);
			%~ figure;imshow(~b + b-g);
			%~ figure;imshow(b- (~g));
			
			%~ 
		%~ se = strel('disk', 20);
		%~ t = imerode(b, se);
		%~ t = imdilate(t, se);
		%~ figure;imshow(t);
		
			%~ figure;imshow(b - ( (b-(~g)) - t) );
			
			newIm = myand(A, g, imPath);
		%~ b - g yi boya
		else % yatlar
			newIm = myand(A, (b - ( (b-(~g)) - t) ), imPath);	
			%~ direk g yi boya
		end	
	end
	
	if (imPath == 'coast3.PNG')
		a = im2bw(A, 0.3);		
		
		cc = bwconncomp(~a);
		n = cellfun(@numel, cc.PixelIdxList);
		[big, idx] = max(n);
		b = zeros(987, 1319);
		b(cc.PixelIdxList{idx}) = 1;
		b = ~b;
		
		%~ iskeleler yok
		
		se = strel('line', 7, 20);
		g = imerode(b, se);
		se = strel('line', 7, 10);
		g = imerode(g, se);
		se = strel('line', 7, 0);
		g = imerode(g, se);
		se = strel('line', 7, 90);
		g = imerode(g, se);
		%~ se = strel('line', 7, 115);
		%~ g = imerode(g, se);
		g = imdilate(g, se);
		se = strel('line', 7, 0);
		g = imdilate(g, se);
		se = strel('line', 7, 10);
		g = imdilate(g, se);
		se = strel('line', 7, 20);
		g = imdilate(g, se);
		se = strel('line', 7, 90);
		g = imdilate(g, se);
		%~ se = strel('line', 7, 0);
		%~ g = imdilate(g, se);
		%~ g = imdilate(g, se);
		
		%~ se = strel('line', 8, 90);
		%~ g = imerode(a, se);
		%~ g = imdilate(g, se);
		%~ se = strel('line', 7, 45);
		%~ g = imerode(g, se);
		%~ g = imdilate(g, se);
		%~ figure; imshow(g);
		
		
		se = strel('disk', 30);
		t = imerode(b, se);
		t = imdilate(t, se);
		%~ figure; imshow(b);
		%~ figure; imshow(t);
		
		if(method == 1) % iskele ve dalgakıranlar	
			newIm = myand(A, g, imPath);	
			%~ b - g yi boya
		else % yatlar
			newIm = myand(A, (b - ( (b-(~g)) - t) ), imPath);	
			%~ direk g yi boya
		end	
	end

%~ newIm = myand(A, g, imPath);
%~ se = strel('line', 6, 10);
 %~ g = imerode(a, se);
 %~ g = imdilate(g, se);
 %~ g = imdilate(g, se);
