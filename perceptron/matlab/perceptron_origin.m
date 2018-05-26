t=1+9*rand(1,100);
t1=t(1:50);
t2=t(51:100);
t01=-3*1+2;t02=-3*10+2;
r1=t01+(t02-t01).*rand(1,50);
r2=t01+(t02-t01).*rand(1,50);
s=-3*t+2;o1=ones(1,50);o2=-1*o1;
for i = 1:50
    while (r1(i)) >= (-3*t1(i)+2)
        r1(i)=r1(i)-(1+9*rand(1));
    end
end
for i=1:50
    while (r2(i)) <= (-3*t2(i)+2)
        r2(i)=r2(i)+(1+9*rand(1));
    end
end
plot(t1,r1,'o',t2,r2,'s',t,s,'-')
T1=[t1;r1;o1];
T2=[t2;r2;o2];
T=[T1 T2];
w=[0,0];b=0;eta=1;
n=length(T);
i=1;
J=[];
while i<=n
    if (T(3,i)*(w*T(1:2,i)+b))<=0
        w=w+eta*T(3,i)*T(1:2,i)';
        b=b+eta*T(3,i);
        J=[J i];
        i=1;
        continue
    else
        i=i+1;
        continue
    end
end
disp([w,b])
disp([-w(1)/w(2),-b/w(2)])