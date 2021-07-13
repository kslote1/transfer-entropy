Q=zeros (N,SimulationSteps);

%Dividing into bins

for k=1:N
    for t=1:SimulationSteps
        
        if alpha (t,k)>pi/2
            Q(k,t)=2;
        elseif alpha (t,k)<-pi/2
            Q(k,t)=3;
        elseif alpha (t,k)<0
            Q(k,t)=4;
        elseif alpha (t,k)>0
            Q(k,t)=1;
        else 
            disp('out of bins')
        end
    end
end

%Probability distribution 
pesce1=1;
pesce2=2;
bin=4;
CONT=zeros(bin,bin,bin);

for a=1:bin
    for b=1:bin
        for c=1:bin
            for t=1:SimulationSteps-1
                if Q(pesce1,t)==b
                    if Q(pesce1,t+1)==a
                        if Q(pesce2,t)==c
                            CONT(a,b,c)=CONT(a,b,c)+1;
                        end
                    end
                end
            end
        end
    end
end
CONT=CONT/(SimulationSteps-1);

%TE computation

TE=0;

for a=1:bin
    for b=1:bin
        for c=1:bin
            
            num=CONT(a,b,c)*sum(sum(CONT(:,b,:)));
            den=sum(CONT(:,b,c))*sum(CONT(a,b,:));
            if num~=0
                if den~=0
                    TE=TE+CONT(a,b,c)*log2(num/den);
                end
            end
            
        end
    end
end

TE





