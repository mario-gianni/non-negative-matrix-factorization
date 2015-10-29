function [ childA1,childA2,childX ] = getChild( Y1,Y2,parentA11,parentA12,parentA21,parentA22,parentX1,parentX2 )

%      a11 = Y1 - parentA11*parentX1;
%      a21 = Y2 - parentA21*parentX1;
%      
%      a21 = Y1 - parentA12*parentX2;
%      a22 = Y2 - parentA22*parentX2;
     
     error1 = norm(Y1 - parentA11*parentX1,'fro') + norm(Y2 - parentA21*parentX1,'fro');
     error2 = norm(Y1 - parentA12*parentX2,'fro') + norm(Y2 - parentA22*parentX2,'fro');
     
     if(error1 > error2)
         childA1 = parentA12;
         childA2 = parentA22;
         childX = parentX2;
         %fprintf('Choosen child 2\n');
     else
         childA1 = parentA11;
         childA2 = parentA21;
         childX = parentX1;
        %fprintf('Choosen child 1\n');
     end

end

