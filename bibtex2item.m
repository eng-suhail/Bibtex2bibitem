function [bibitem]= bibtex2item(bibtexpath)
path = bibtexpath;
cells = importdata(path);
n = length(cells);
A = string(cells);
k = cell(n,1);
K(1) = extractBetween(A(1),'{',','); 
    for i=2:n-1
            f = extractBefore(A(i),'=');
            P = strtrim(f);
              if strcmp(P,"author")
                    output = extractBetween(A(i),'{','}');
                    K(2) = strtrim(output);              
              elseif strcmp(P,"title")
                    output = extractBetween(A(i),'{','}');
                    K(3) = strtrim(output);            
              elseif strcmp(P,"journal")
                    output = extractBetween(A(i),'{','}');
                    K(4) = strtrim(output);             
              elseif strcmp(P,"year")
                    output = extractBetween(A(i),'{','}');
                    K(5) = strtrim(output);
              elseif strcmp(P,"number")
                    output = extractBetween(A(i),'{','}');
                    K(6) = strtrim(output);
              elseif strcmp(P,"pages")
                    output = extractBetween(A(i),'{','}');
                    K(7) = strtrim(output);
              elseif strcmp(P,"volume")
                    output = extractBetween(A(i),'{','}');
                    K(8) = strtrim(output);
              end
    end

disp(['\bibitem{',num2str(K(1)),'}'])
disp([num2str(K(2)),'.'])
disp(['\newblock',' ',num2str(K(3))])
disp(['\newblock \emph ', num2str(K(4)),', ', num2str(K(8)),'\penalty0 ',num2str(K(6)),':\penalty0',' ',num2str(K(7)),',',num2str(K(5)),'.'])
end
