function [c, ceq] = simple_constraint(x)
%fprintf('Length of the input for contraint: %d\n', size(x,2));
% new_x = x(1,:);
i1 = 5;
i2 = 7;
t = 4;
j = min([i1 i2 t]);
c = [];
%ceq = [];
%X = reshape(new_x((i1*j+i2*j+1):((i1*j+i2*j+j*t))),j,t);


% for h = (i1*j+i2*j+1):((i1*j+i2*j+j*t))
%     
% end


ceq(:,1) = x(:,i1*j+i2*j+1).^2 + x(:,i1*j+i2*j+5).^2 + x(:,i1*j+i2*j+9).^2 + x(:,i1*j+i2*j+13).^2 - 1;
ceq(:,2) = x(:,i1*j+i2*j+2).^2 + x(:,i1*j+i2*j+6).^2 + x(:,i1*j+i2*j+10).^2 + x(:,i1*j+i2*j+14).^2 - 1;
ceq(:,3) = x(:,i1*j+i2*j+3).^2 + x(:,i1*j+i2*j+7).^2 + x(:,i1*j+i2*j+11).^2 + x(:,i1*j+i2*j+15).^2 - 1;
ceq(:,4) = x(:,i1*j+i2*j+4).^2 + x(:,i1*j+i2*j+8).^2 + x(:,i1*j+i2*j+12).^2 + x(:,i1*j+i2*j+16).^2 - 1;
ceq(:,5) = x(:,i1*j+i2*j+1).*x(:,i1*j+i2*j+2) + x(:,i1*j+i2*j+5).*x(:,i1*j+i2*j+6)+x(:,i1*j+i2*j+9).*x(:,i1*j+i2*j+10) + x(:,i1*j+i2*j+13).*x(:,i1*j+i2*j+14); 
ceq(:,6) = x(:,i1*j+i2*j+1).*x(:,i1*j+i2*j+3) + x(:,i1*j+i2*j+5).*x(:,i1*j+i2*j+7)+x(:,i1*j+i2*j+9).*x(:,i1*j+i2*j+11) + x(:,i1*j+i2*j+13).*x(:,i1*j+i2*j+15); 
ceq(:,7) = x(:,i1*j+i2*j+1).*x(:,i1*j+i2*j+4) + x(:,i1*j+i2*j+5).*x(:,i1*j+i2*j+8)+x(:,i1*j+i2*j+9).*x(:,i1*j+i2*j+12) + x(:,i1*j+i2*j+13).*x(:,i1*j+i2*j+16); 
ceq(:,8) = x(:,i1*j+i2*j+2).*x(:,i1*j+i2*j+3) + x(:,i1*j+i2*j+6).*x(:,i1*j+i2*j+7)+x(:,i1*j+i2*j+10).*x(:,i1*j+i2*j+11) + x(:,i1*j+i2*j+14).*x(:,i1*j+i2*j+15); 
ceq(:,9) = x(:,i1*j+i2*j+2).*x(:,i1*j+i2*j+4) + x(:,i1*j+i2*j+6).*x(:,i1*j+i2*j+8)+x(:,i1*j+i2*j+10).*x(:,i1*j+i2*j+12) + x(:,i1*j+i2*j+14).*x(:,i1*j+i2*j+16); 
ceq(:,10) = x(:,i1*j+i2*j+3).*x(:,i1*j+i2*j+4) + x(:,i1*j+i2*j+7).*x(:,i1*j+i2*j+8)+x(:,i1*j+i2*j+11).*x(:,i1*j+i2*j+12) + x(:,i1*j+i2*j+15).*x(:,i1*j+i2*j+16);

% index = 1;
% for h = 1 : j
%     for k = 1 : j
%         if(h == k)
%             ceq(1,index) = X(h,:)*X(k,:)'-1;
%             ceq(2,index) = X(h,:)*X(k,:)'-1;
%             index = index + 1;
%         else
%             ceq(1,index) = X(h,:)*X(k,:)';
%             ceq(2,index) = X(h,:)*X(k,:)'-1;
%             index = index + 1;
%         end
%     end
% end
% size(ceq)
end

