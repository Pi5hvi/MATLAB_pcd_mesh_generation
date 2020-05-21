%% Reading file, setting resolution and making margins
prompt='Input resolution in terms of number of pixels desired along shortest length:';
res=input(prompt);%Required resolution=res
P=loadpcd('H:\Geometric Modelling\Project\tabletop_high_resolution\rhino.pcd');
[m,n]=size(P);%m=3, n= no of points
leastx=P(1,1);
largestx=P(1,1);
leasty=P(2,1);
largesty=P(2,1);
leastz=P(2,1);
largestz=P(2,1);
for i=1:n
    if leastx>P(1,i)
        leastx=P(1,i);
    end
    if largestx<P(1,i)
        largestx=P(1,i);
    end
end
for i=1:n
    if leasty>P(2,i)
        leasty=P(2,i);
    end
    if largesty<P(2,i)
        largesty=P(2,i);
    end
end
for i=1:n
    if leastz>P(3,i)
        leastz=P(3,i);
    end
    if largestz<P(3,i)
        largestz=P(3,i);
    end
end
lengthx=largestx-leastx;%x-length
lengthy=largesty-leasty;%y-length
lengthz=largestz-leastz;%z-length
smallestdim=lengthx;
if smallestdim > lengthy
    smallestdim=lengthy;
end
if smallestdim > lengthz
    smallestdim=lengthz;
end
cubelength=smallestdim/res;
resx=round(lengthx/cubelength)+1;%No of edges in x direction
resy=round(lengthy/cubelength)+1;%No of edges in y direction
resz=round(lengthz/cubelength)+1;%No of edges in z direction
%% Edge intersection algorithm
%marking starting point
c1x=leastx;
c1y=leasty;
c1z=leastz;
totalcubes=resx.*resy.*resz;%Total no. of cubes
vertex1_x=zeros(1,totalcubes);
vertex1_y=zeros(1,totalcubes);
vertex1_z=zeros(1,totalcubes);
vertex2_x=zeros(1,totalcubes);
vertex2_y=zeros(1,totalcubes);
vertex2_z=zeros(1,totalcubes);
vertex3_x=zeros(1,totalcubes);
vertex3_y=zeros(1,totalcubes);
vertex3_z=zeros(1,totalcubes);
vertex4_x=zeros(1,totalcubes);
vertex4_y=zeros(1,totalcubes);
vertex4_z=zeros(1,totalcubes);
vertex5_x=zeros(1,totalcubes);
vertex5_y=zeros(1,totalcubes);
vertex5_z=zeros(1,totalcubes);
vertex6_x=zeros(1,totalcubes);
vertex6_y=zeros(1,totalcubes);
vertex6_z=zeros(1,totalcubes);
vertex7_x=zeros(1,totalcubes);
vertex7_y=zeros(1,totalcubes);
vertex7_z=zeros(1,totalcubes);
vertex8_x=zeros(1,totalcubes);
vertex8_y=zeros(1,totalcubes);
vertex8_z=zeros(1,totalcubes);
edge1_x=zeros(1,totalcubes);
edge1_y=zeros(1,totalcubes);
edge1_z=zeros(1,totalcubes);
edge2_x=zeros(1,totalcubes);
edge2_y=zeros(1,totalcubes);
edge2_z=zeros(1,totalcubes);
edge3_x=zeros(1,totalcubes);
edge3_y=zeros(1,totalcubes);
edge3_z=zeros(1,totalcubes);
edge4_x=zeros(1,totalcubes);
edge4_y=zeros(1,totalcubes);
edge4_z=zeros(1,totalcubes);
edge5_x=zeros(1,totalcubes);
edge5_y=zeros(1,totalcubes);
edge5_z=zeros(1,totalcubes);
edge6_x=zeros(1,totalcubes);
edge6_y=zeros(1,totalcubes);
edge6_z=zeros(1,totalcubes);
edge7_x=zeros(1,totalcubes);
edge7_y=zeros(1,totalcubes);
edge7_z=zeros(1,totalcubes);
edge8_x=zeros(1,totalcubes);
edge8_y=zeros(1,totalcubes);
edge8_z=zeros(1,totalcubes);
edge9_x=zeros(1,totalcubes);
edge9_y=zeros(1,totalcubes);
edge9_z=zeros(1,totalcubes);
edge10_x=zeros(1,totalcubes);
edge10_y=zeros(1,totalcubes);
edge10_z=zeros(1,totalcubes);
edge11_x=zeros(1,totalcubes);
edge11_y=zeros(1,totalcubes);
edge11_z=zeros(1,totalcubes);
edge12_x=zeros(1,totalcubes);
edge12_y=zeros(1,totalcubes);
edge12_z=zeros(1,totalcubes);
%defining the vertices of the cubes
vertex1_x(1)=c1x;
vertex1_y(1)=c1y;
vertex1_z(1)=c1z;
vertex2_x(1)=(c1x+cubelength);
vertex2_y(1)=c1y;
vertex2_z(1)=c1z;
vertex3_x(1)=(c1x+cubelength);
vertex3_y(1)=(c1y+cubelength);
vertex3_z(1)=c1z;
vertex4_x(1)=c1x;
vertex4_y(1)=(c1y+cubelength);
vertex4_z(1)=c1z;
vertex5_x(1)=c1x;
vertex5_y(1)=c1y;
vertex5_z(1)=(c1z+cubelength);
vertex6_x(1)=(c1x+cubelength);
vertex6_y(1)=c1y;
vertex6_z(1)=(c1z+cubelength);
vertex7_x(1)=(c1x+cubelength);
vertex7_y(1)=(c1y+cubelength);
vertex7_z(1)=(c1z+cubelength);
vertex8_x(1)=c1x;
vertex8_y(1)=(c1y+cubelength);
vertex8_z(1)=(c1z+cubelength);
i=1;
while i<totalcubes
    %checking intersection on each end
    for j=1:n
        if vertex1_y(i)-P(2,j)<0.0005
            if vertex1_z(i)-P(3,j)<0.0005
                if vertex1_x(i)<P(1,j)
                    if vertex2_x(i)>P(1,j)
                        edge1_x(i)=P(1,j);
                        edge1_y(i)=P(2,j);
                        edge1_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex2_x(i)-P(1,j)<0.0005
            if vertex2_z(i)-P(3,j)<0.0005
                if vertex2_y(i)<P(2,j)
                    if vertex3_y(i)>P(2,j)
                        edge2_x(i)=P(1,j);
                        edge2_y(i)=P(2,j);
                        edge2_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex4_y(i)-P(2,j)<0.0005
            if vertex4_z(i)-P(3,j)<0.0005
                if vertex4_x(i)<P(1,j)
                    if vertex3_x(i)>P(1,j)
                        edge3_x(i)=P(1,j);
                        edge3_y(i)=P(2,j);
                        edge3_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex1_x(i)-P(2,j)<0.0005
            if vertex1_z(i)-P(3,j)<0.0005
                if vertex1_y(i)<P(2,j)
                    if vertex4_x(i)>P(1,j)
                        edge4_x(i)=P(1,j);
                        edge4_y(i)=P(2,j);
                        edge4_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex1_y(i)-P(2,j)<0.0005
            if vertex1_x(i)-P(1,j)<0.0005
                if vertex1_z(i)<P(3,j)
                    if vertex5_z(i)>P(3,j)
                        edge5_x(i)=P(1,j);
                        edge5_y(i)=P(2,j);
                        edge5_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex2_y(i)-P(2,j)<0.0005
            if vertex2_x(i)-P(1,j)<0.0005
                if vertex2_z(i)<P(3,j)
                    if vertex6_z(i)>P(3,j)
                        edge6_x(i)=P(1,j);
                        edge6_y(i)=P(2,j);
                        edge6_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex3_y(i)-P(2,j)<0.0005
            if vertex3_x(i)-P(1,j)<0.0005
                if vertex3_z(i)<P(3,j)
                    if vertex7_z(i)>P(3,j)
                        edge7_x(i)=P(1,j);
                        edge7_y(i)=P(2,j);
                        edge7_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex4_y(i)-P(2,j)<0.0005
            if vertex4_x(i)-P(1,j)<0.0005
                if vertex4_z(i)<P(1,j)
                    if vertex8_z(i)>P(1,j)
                        edge8_x(i)=P(1,j);
                        edge8_y(i)=P(2,j);
                        edge8_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex5_y(i)-P(2,j)<0.0005
            if vertex5_z(i)-P(3,j)<0.0005
                if vertex5_x(i)<P(1,j)
                    if vertex6_x(i)>P(1,j)
                        edge9_x(i)=P(1,j);
                        edge9_y(i)=P(2,j);
                        edge9_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex6_x(i)-P(1,j)<0.0005
            if vertex6_z(i)-P(3,j)<0.0005
                if vertex6_y(i)<P(2,j)
                    if vertex7_y(i)>P(2,j)
                        edge10_x(i)=P(1,j);
                        edge10_y(i)=P(2,j);
                        edge10_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex7_y(i)-P(2,j)<0.0005
            if vertex7_z(i)-P(3,j)<0.0005
                if vertex7_x(i)>P(1,j)
                    if vertex8_x(i)<P(1,j)
                        edge11_x(i)=P(1,j);
                        edge11_y(i)=P(2,j);
                        edge11_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    for j=1:n
        if vertex8_x(i)-P(1,j)<0.0005
            if vertex8_z(i)-P(3,j)<0.0005
                if vertex8_y(i)>P(2,j)
                    if vertex5_y(i)<P(2,j)
                        edge12_x(i)=P(1,j);
                        edge12_y(i)=P(2,j);
                        edge12_z(i)=P(3,j);
                    end
                end
            end
        end
    end
    %% Marching Algorithm
    
    if vertex2_x(i)<lengthx%march x
        vertex1_x(i+1)=vertex1_x(i)+cubelength;
        vertex1_y(i+1)=vertex1_y(i);
        vertex1_z(i+1)=vertex1_z(i);
        vertex2_x(i+1)=vertex2_x(i)+cubelength;
        vertex2_y(i+1)=vertex2_y(i);
        vertex2_z(i+1)=vertex2_z(i);
        vertex3_x(i+1)=vertex3_x(i)+cubelength;
        vertex3_y(i+1)=vertex3_y(i);
        vertex3_z(i+1)=vertex3_z(i);
        vertex4_x(i+1)=vertex4_x(i)+cubelength;
        vertex4_y(i+1)=vertex4_y(i);
        vertex4_z(i+1)=vertex4_z(i);
        vertex5_x(i+1)=vertex5_x(i)+cubelength;
        vertex5_y(i+1)=vertex5_y(i);
        vertex5_z(i+1)=vertex5_z(i);
        vertex6_x(i+1)=vertex6_x(i)+cubelength;
        vertex6_y(i+1)=vertex6_y(i);
        vertex6_z(i+1)=vertex6_z(i);
        vertex7_x(i+1)=vertex7_x(i)+cubelength;
        vertex7_y(i+1)=vertex7_y(i);
        vertex7_z(i+1)=vertex7_z(i);
        vertex8_x(i+1)=vertex8_x(i)+cubelength;
        vertex8_y(i+1)=vertex8_y(i);
        vertex8_z(i+1)=vertex8_z(i);
    else if vertex5_y<lengthy%marchy
            vertex1_x(i+1)=c1x;
            vertex1_y(i+1)=vertex1_y(i)+cubelength;
            vertex1_z(i+1)=vertex1_z(i);
            vertex2_x(i+1)=(c1x+cubelength);
            vertex2_y(i+1)=vertex2_y(i)+cubelength;
            vertex2_z(i+1)=vertex2_z(i);
            vertex3_x(i+1)=(c1x+cubelength);
            vertex3_y(i+1)=vertex3_y(i)+cubelength;
            vertex3_z(i+1)=vertex3_z(i);
            vertex4_x(i+1)=c1x;
            vertex4_y(i+1)=vertex4_y(i)+cubelength;
            vertex4_z(i+1)=vertex4_z(i);
            vertex5_x(i+1)=c1x;
            vertex5_y(i+1)=vertex5_y(i)+cubelength;
            vertex5_z(i+1)=vertex5_z(i);
            vertex6_x(i+1)=(c1x+cubelength);
            vertex6_y(i+1)=vertex6_y(i)+cubelength;
            vertex6_z(i+1)=vertex6_z(i);
            vertex7_x(i+1)=(c1x+cubelength);
            vertex7_y(i+1)=vertex7_y(i)+cubelength;
            vertex7_z(i+1)=vertex7_z(i);
            vertex8_x(i+1)=c1x;
            vertex8_y(i+1)=vertex8_y(i)+cubelength;
            vertex8_z(i+1)=vertex8_z(i); 
        else%marchz
                vertex1_x(i+1)=c1x;
                vertex1_y(i+1)=c1y;
                vertex1_z(i+1)=vertex1_z(i)+cubelength;
                vertex2_x(i+1)=(c1x+cubelength);
                vertex2_y(i+1)=c1y;
                vertex2_z(i+1)=vertex2_z(i)+cubelength;
                vertex3_x(i+1)=(c1x+cubelength);
                vertex3_y(i+1)=(c1y+cubelength);
                vertex3_z(i+1)=vertex3_z(i)+cubelength;
                vertex4_x(i+1)=c1x;
                vertex4_y(i+1)=(c1y+cubelength);
                vertex4_z(i+1)=vertex4_z(i)+cubelength;
                vertex5_x(i+1)=c1x;
                vertex5_y(i+1)=c1y;
                vertex5_z(i+1)=vertex5_z(i)+cubelength;
                vertex6_x(i+1)=(c1x+cubelength);
                vertex6_y(i+1)=c1y;
                vertex6_z(i+1)=vertex6_z(i)+cubelength;
                vertex7_x(i+1)=(c1x+cubelength);
                vertex7_y(i+1)=(c1y+cubelength);
                vertex7_z(i+1)=vertex7_z(i)+cubelength;
                vertex8_x(i+1)=c1x;
                vertex8_y(i+1)=(c1y+cubelength);
                vertex8_z(i+1)=vertex8_z(i)+cubelength; 
        end
    end
i=i+1;
    
end
plot3 (0,0,0,'o');
hold on
for i=1:totalcubes
plot3(edge1_x(i),edge1_y(i),edge1_z(i),'*');
plot3(edge2_x(i),edge2_y(i),edge2_z(i),'*');
plot3(edge3_x(i),edge3_y(i),edge3_z(i),'*');
plot3(edge4_x(i),edge4_y(i),edge4_z(i),'*');
plot3(edge5_x(i),edge5_y(i),edge5_z(i),'*');
plot3(edge6_x(i),edge6_y(i),edge6_z(i),'*');
plot3(edge7_x(i),edge7_y(i),edge7_z(i),'*');
plot3(edge8_x(i),edge8_y(i),edge8_z(i),'*');
plot3(edge9_x(i),edge9_y(i),edge9_z(i),'*');
plot3(edge10_x(i),edge10_y(i),edge10_z(i),'*');
plot3(edge11_x(i),edge11_y(i),edge11_z(i),'*');
plot3(edge12_x(i),edge12_y(i),edge12_z(i),'*');
end
%% Plotting algorithm
for i=1:totalcubes
%%Corners cut
e1=0;
e2=0;
e3=0;
e4=0;
e5=0;
e6=0;
e7=0;
e8=0;
e9=0;
e10=0;
e11=0;
e12=0;
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end
    
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end
    
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end
    
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end
    
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end
    
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end
    
    if [edge1_x(i),edge1_y(i),edge1_z(i)]~=[0,0,0]
       e1=1;
    end