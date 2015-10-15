function [ childA1,childA2,childX ] = getChild( Y1,Y2,parentA11,parentA12,parentA21,parentA22,parentX1,parentX2 )

     a11 = Y1 - parentA11*parentX1;
     a21 = Y2 - parentA21*parentX1;
     
     a21 = Y1 - parentA12*parentX2;
     a22 = Y2 - parentA22*parentX2;
     
     error1 = norm(a11,'fro') + norm(a21);
     error2 = norm(a21,'fro') + norm(a22);
     
     if(error1 > error2)
         childA1 = parentA12;
         childA2 = parentA22;
         childX = parentX2;
     else
         childA1 = parentA11;
         childA2 = parentA21;
         childX = parentX1;
     end

end

