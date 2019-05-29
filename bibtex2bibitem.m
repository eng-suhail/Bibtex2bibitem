%--------------------------------------------------------------------------
%  ____  _ _  _______  __   __  ___  _     _ _     _ _                 
% |  _ \(_) ||__   __| \ \ / / |__ \| |   (_) |   (_) |                
% | |_) |_| |__ | | ___ \ V /     ) | |__  _| |__  _| |_ ___ _ __ ___  
% |  _ <| | '_ \| |/ _ \ > <     / /| '_ \| | '_ \| | __/ _ \ '_ ` _ \ 
% | |_) | | |_) | |  __// . \   / /_| |_) | | |_) | | ||  __/ | | | | |
% |____/|_|_.__/|_|\___/_/ \_\ |____|_.__/|_|_.__/|_|\__\___|_| |_| |_|

%--------------------------------------------------------------------------
function [bibitem] = bibtex2bibitem(bibtexpath)
path = bibtexpath;
cells = importdata(path);
A = string(cells);
n = length(cells);
K_name = strings(n,1);
citecode = extractBetween(A(1),'{',',');
type = extractBetween(A(1),'@','{');
K_name(1) = strtrim(type);
SVacI = zeros(1,9);
%--------------------------------------------------------------------
%                       HANDLING ARTICLES                              -
%--------------------------------------------------------------------
    if strcmp(K_name(1),"article")
            for i = 2:1:n-1
                rawleft = extractBefore(A(i),'=');
                K_name(i) = strtrim(rawleft);

        %--------------------------------------------------------------------
                if strcmp(K_name(i),"author")
                    SVacI(1) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        author = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        author = strtrim(extractBetween(A(i),'"','"'));
                    else
                        author = strtrim(extractBetween(A(i),'=',','));
                    end 

        %--------------------------------------------------------------------         
                elseif strcmp(K_name(i),"title")
                    SVacI(2) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        title = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        title = strtrim(extractBetween(A(i),'"','"'));
                    else
                        title = strtrim(extractBetween(A(i),'=',','));
                    end 

        %--------------------------------------------------------------------
                elseif strcmp(K_name(i),"journal")
                    SVacI(3) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        journal = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        journal = strtrim(extractBetween(A(i),'"','"'));
                    else
                        journal = strtrim(extractBetween(A(i),'=',','));
                    end    
        %--------------------------------------------------------------------
                elseif strcmp(K_name(i),"volume")
                    SVacI(4) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        volume = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        volume = strtrim(extractBetween(A(i),'"','"'));
                    else
                        volume = strtrim(extractBetween(A(i),'=',','));
                    end 
        %--------------------------------------------------------------------
                elseif (strcmp(K_name(i),"number"))||(strcmp(K_name(i),"issue"))
                    SVacI(5) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        number = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        number = strtrim(extractBetween(A(i),'"','"'));
                    else
                        number = strtrim(extractBetween(A(i),'=',','));
                    end 

        %--------------------------------------------------------------------
                elseif strcmp(K_name(i),"pages")
                    SVacI(6) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        pages = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        pages = strtrim(extractBetween(A(i),'"','"'));
                    else
                        pages = strtrim(extractBetween(A(i),'=',','));
                    end 

        %--------------------------------------------------------------------
                elseif strcmp(K_name(i),"month")
                    SVacI(7) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        month = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        month = strtrim(extractBetween(A(i),'"','"'));
                    else
                        month = strtrim(extractBetween(A(i),'=',','));
                    end 

        %--------------------------------------------------------------------
                elseif strcmp(K_name(i),"year")
                    SVacI(8) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        year = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        year = strtrim(extractBetween(A(i),'"','"'));
                    else
                        year = strtrim(extractBetween(A(i),'=',','));
                    end 

        %--------------------------------------------------------------------
                elseif strcmp(K_name(i),"publisher")
                    SVacI(9) = 1;
                    rawright = extractAfter(A(i),'=');
                    ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                    ccb1 = regexp(rawright,'"');
                    if (ccb~=0)
                        publisher = strtrim(extractBetween(A(i),'{','}'));
                    elseif (ccb1~=0)
                        publisher = strtrim(extractBetween(A(i),'"','"'));
                    else
                        publisher = strtrim(extractBetween(A(i),'=',','));
                    end        

        %--------------------------------------------------------------------
                else
                    msg = join(["Sorry!","[", K_name(i), "]","is not being handled by the program."]);
                    disp(msg)
                end
            end


%--------------------------------------------------------------------
%               @-> Style reference term code varifications. 
%                  msg = join(["author","=",SVacI(1);...
%                              "title","=",SVacI(2);...
%                              "journal","=",SVacI(3);...
%                              "volume","=",SVacI(4);...
%                              "number","=",SVacI(5);...
%                              "pages","=",SVacI(6);...
%                              "month","=",SVacI(7);...
%                              "year","=",SVacI(8);...
%                              "publisher","=",SVacI(9)]);
%                              disp(SVacI)
%--------------------------------------------------------------------
              if all(SVacI(1)==0)||(SVacI(2)==0)||(SVacI(8)==0)||(SVacI(3)==0)
                  bibitem = sprintf('THE ARTICLE IS NOT CORRECT. THE AUTHOR, TITLE, JOURNAL AND YEAR SECTIONS ARE COMPULSORY! PLEASE INCLUDE THEM AND RE-RUN THE SOFTWARE:)');
              elseif all(SVacI == [1	1	1	0	0	0	0	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/},(%s).',citecode,author,title,journal,year);
              elseif all(SVacI == [1	1	1	0	0	0	0	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/},(%s). %s.\n',citecode,author,title,journal,year,publisher);
              elseif all(SVacI == [1	1	1	0	0	0	1	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/},(%s %s).',citecode,author,title,journal,month,year);
              elseif all(SVacI == [1	1	1	0	0	0	1	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/},(%s %s). %s.',citecode,author,title,journal,month,year,publisher);
              elseif all(SVacI == [1	1	1	0	0	1	0	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, %s,(%s).',citecode,author,title,journal,pages,year);
              elseif all(SVacI == [1	1	1	0	0	1	0	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, %s,(%s). %s.',citecode,author,title,journal,pages,year,publisher);
              elseif all(SVacI == [1	1	1	0	0	1	1	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, %s,(%s %s).',citecode,author,title,journal,pages,month,year);
              elseif all(SVacI == [1	1	1	0	0	1	1	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, %s,(%s %s). %s.',citecode,author,title,journal,pages,month,year,publisher);
              elseif all(SVacI == [1	1	1	0	1	0	0	1	0])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s,(%s).',citecode,author,title,journal,number,year);
              elseif all(SVacI == [1	1	1	0	1	0	0	1	1])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s,(%s). %s.',citecode,author,title,journal,number,year,publisher);
              elseif all(SVacI == [1	1	1	0	1	0	1	1	0])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s,(%s %s).',citecode,author,title,journal,number,month,year);
              elseif all(SVacI == [1	1	1	0	1	0	1	1	1])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s,(%s %s). %s.',citecode,author,title,journal,number,month,year,publisher);
              elseif all(SVacI == [1	1	1	0	1	1	0	1	0])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s, %s,(%s).',citecode,author,title,journal,number,pages,year);
              elseif all(SVacI == [1	1	1	0	1	1	0	1	1])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s, %s,(%s). %s.',citecode,author,title,journal,number,pages,year,publisher);
              elseif all(SVacI == [1	1	1	0	1	1	1	1	0])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s, %s,(%s %s).',citecode,author,title,journal,number,pages,month,year);
              elseif all(SVacI == [1	1	1	0	1	1	1	1	1])
                  disp("Attention! THE VOLUME HAS TO BE ASSOCIATED WITH NUMBER, PLEASE CHECK!") 
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, No.~%s, %s,(%s %s). %s.',citecode,author,title,journal,number,pages,month,year,publisher);
              elseif all(SVacI == [1	1	1	1	0	0	0	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s,(%s).',citecode,author,title,journal,volume,year);
              elseif all(SVacI == [1	1	1	1	0	0	0	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s,(%s). %s.',citecode,author,title,journal,volume,year,publisher);
              elseif all(SVacI == [1	1	1	1	0	0	1	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s,(%s %s).',citecode,author,title,journal,volume,month,year);
              elseif all(SVacI == [1	1	1	1	0	0	1	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s,(%s %s). %s.',citecode,author,title,journal,volume,month,year,publisher);
              elseif all(SVacI == [1	1	1	1	0	1	0	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, %s,(%s).',citecode,author,title,journal,volume,pages,year);
              elseif all(SVacI == [1	1	1	1	0	1	0	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, %s,(%s). %s.',citecode,author,title,journal,volume,pages,year,publisher);
              elseif all(SVacI == [1	1	1	1	0	1	1	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, %s,(%s %s).',citecode,author,title,journal,volume,pages,month,year);
              elseif all(SVacI == [1	1	1	1	0	1	1	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, %s,(%s %s). %s.',citecode,author,title,journal,volume,pages,month,year,publisher);
              elseif all(SVacI == [1	1	1	1	1	0	0	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s,(%s).',citecode,author,title,journal,volume,number,year);
              elseif all(SVacI == [1	1	1	1	1	0	0	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s,(%s). %s.',citecode,author,title,journal,volume,number,year,publisher);
              elseif all(SVacI == [1	1	1	1	1	0	1	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s,(%s %s).',citecode,author,title,journal,volume,number,month,year);
              elseif all(SVacI == [1	1	1	1	1	0	1	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s,(%s %s). %s.',citecode,author,title,journal,volume,number,month,year,publisher);
              elseif all(SVacI == [1	1	1	1	1	1	0	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s, %s,(%s).',citecode,author,title,journal,volume,number,pages,year);
              elseif all(SVacI == [1	1	1	1	1	1	0	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~ %s, %s,(%s). %s.',citecode,author,title,journal,volume,number,pages,year,publisher);
              elseif all(SVacI == [1	1	1	1	1	1	1	1	0])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s, %s,(%s %s).',citecode,author,title,journal,volume,number,pages,month,year);
              elseif all(SVacI == [1	1	1	1	1	1	1	1	1])
                  bibitem = sprintf('\\bibitem{%s} %s,``%s," {\\it %s\\/}, Vol.~%s, No.~%s, %s,(%s %s). %s.',citecode,author,title,journal,volume,number,pages,month,year,publisher);
              end 
              clipboard('copy',bibitem);
              disp('The bibitem has been copied to the clipboard!')

    %--------------------------------------------------------------------
    %                       HANDLING BOOKS                              -
    %--------------------------------------------------------------------
    elseif strcmp(K_name(1),"book")
       disp('Book')
           for i = 2:1:n-1
            rawleft = extractBefore(A(i),'=');
            K_name(i) = strtrim(rawleft);
    %-(1)-------------------------------------------------------------------
           if strcmp(K_name(i),"author")
                SVacI(1) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    author = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    author = strtrim(extractBetween(A(i),'"','"'));
                else
                    author = strtrim(extractBetween(A(i),'=',','));
                end 
    %-(2)-------------------------------------------------------------------         
            elseif strcmp(K_name(i),"title")
                SVacI(2) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    title = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    title = strtrim(extractBetween(A(i),'"','"'));
                else
                    title = strtrim(extractBetween(A(i),'=',','));
                end 
    %-(3)-------------------------------------------------------------------         
            elseif strcmp(K_name(i),"city")
                SVacI(3) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    city = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    city = strtrim(extractBetween(A(i),'"','"'));
                else
                    city = strtrim(extractBetween(A(i),'=',','));
                end

    %-(4)-------------------------------------------------------------------         
            elseif strcmp(K_name(i),"state")
                SVacI(4) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    state = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    state = strtrim(extractBetween(A(i),'"','"'));
                else
                    state = strtrim(extractBetween(A(i),'=',','));
                end

    %-(5)-------------------------------------------------------------------         
            elseif strcmp(K_name(i),"publisher")
                SVacI(5) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    publisher = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    publisher = strtrim(extractBetween(A(i),'"','"'));
                else
                    publisher = strtrim(extractBetween(A(i),'=',','));
                end
    %-(6)-------------------------------------------------------------------         
            elseif strcmp(K_name(i),"month")
                SVacI(6) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    month = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    month = strtrim(extractBetween(A(i),'"','"'));
                else
                    month = strtrim(extractBetween(A(i),'=',','));
                end
    %-(7)----------------------------------------------------------------------        
            elseif strcmp(K_name(i),"year")
                SVacI(7) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    year = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    year = strtrim(extractBetween(A(i),'"','"'));
                else
                    year = strtrim(extractBetween(A(i),'=',','));
                end
    %-(8)-------------------------------------------------------------------         
            elseif strcmp(K_name(i),"volume")
                SVacI(8) = 1;
                rawright = extractAfter(A(i),'=');
                ccb = regexp(rawright,'}');     % ccb = [check curly bracket]
                ccb1 = regexp(rawright,'"');
                if (ccb~=0)
                    volume = strtrim(extractBetween(A(i),'{','}'));
                elseif (ccb1~=0)
                    volume = strtrim(extractBetween(A(i),'"','"'));
                else
                    volume = strtrim(extractBetween(A(i),'=',','));
                end
    %-------------------------------------------------------------------- 
                else
                    msg = join(["Sorry!", K_name(i), "={}","is not being handled by the program."]);
                    disp(msg)
            end
           end
    %--------------------------------------------------------------------
    %               @-> Style reference term code varifications. 
    %                  msg = join(["author","=",SVacI(1);...
    %                              "title","=",SVacI(2);...
    %                              "city","=",SVacI(3);...
    %                              "state","=",SVacI(4);...
    %                              "publisher","=",SVacI(5);...
    %                              "month","=",SVacI(6);...
    %                              "year","=",SVacI(7);...
    %                              disp(SVacI)
    %--------------------------------------------------------------------
                    if all(SVacI(1)==0)||(SVacI(2)==0)||(SVacI(5)==0)||(SVacI(7)==0)
                      bibitem = sprintf('THE ARTICLE IS NOT CORRECT. THE AUTHOR, TITLE, PUBLISHER AND YEAR SECTIONS ARE COMPULSORY FOR BOOK CITATION!');
                    elseif all(SVacI == [1	1	0	0	1	0	1   0])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s, %s.',citecode,author,title,publisher,year);
                    elseif all(SVacI == [1	1	0	0	1	0	1   1])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/} (Vol.%s), %s, %s.',citecode,author,title,volume,publisher,year);
                    elseif all(SVacI == [1	1	0	0	1	1	1   0])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s, %s %s.',citecode,author,title,publisher,month,year);
                    elseif all(SVacI == [1	1	0	0	1	1	1   1])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/} (Vol.%s), %s, %s %s.',citecode,author,title,volume,publisher,month,year);                  
                    elseif all(SVacI == [1	1	0	1	1	0	1   0])
                      disp('CITY HAS TO BE PROVIDED!')
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s:, %s, %s.',citecode,author,title,state,publisher,year);   
                    elseif all(SVacI == [1	1	0	1	1	0	1   1])
                      disp('CITY HAS TO BE PROVIDED!')
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}(Vol.%s), %s:, %s, %s.',citecode,author,title,volume,state,publisher,year); 
                    elseif all(SVacI == [1	1	0	1	1	1	1   0])
                      disp('CITY HAS TO BE PROVIDED!')
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s:, %s, %s %s.',citecode,author,title,state,publisher,month,year);
                    elseif all(SVacI == [1	1	0	1	1	1	1   1])
                      disp('CITY HAS TO BE PROVIDED!')
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}(Vol.%s), %s:, %s, %s %s.',citecode,author,title,volume,state,publisher,month,year);
                    elseif all(SVacI == [1	1	1	0	1	0	1   0])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s:, %s, %s.',citecode,author,title,city,publisher,year); 
                    elseif all(SVacI == [1	1	1	0	1	0	1   1])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}(Vol.%s), %s:, %s, %s.',citecode,author,title,volume,city,publisher,year); 
                    elseif all(SVacI == [1	1	1	0	1	1	1   0])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s:, %s, %s %s.',citecode,author,title,city,publisher,month,year); 
                    elseif all(SVacI == [1	1	1	0	1	1	1   1])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}(Vol.%s), %s:, %s, %s %s.',citecode,author,title,volume,city,publisher,month,year); 
                    elseif all(SVacI == [1	1	1	1	1	0	1   0])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s, %s:, %s %s.',citecode,author,title,city,state,publisher,year);
                    elseif all(SVacI == [1	1	1	1	1	0	1   1])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}(Vol.%s), %s, %s:, %s %s.',citecode,author,title,city,state,publisher,year);
                    elseif all(SVacI == [1	1	1	1	1	1	1   0])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}, %s, %s:, %s, %s %s.',citecode,author,title,city,state,publisher,month,year);
                    elseif all(SVacI == [1	1	1	1	1	1	1   1])
                      bibitem = sprintf('\\bibitem{%s} %s, {\\it %s\\/}(Vol.%s), %s, %s:, %s, %s %s.',citecode,author,title,volume,city,state,publisher,month,year);
                    end 
            clipboard('copy',bibitem);
            disp('The bibitem has been copied to the clipboard!')
    end 
end