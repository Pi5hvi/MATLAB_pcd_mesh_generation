%% Reading file, setting resolution and making margins
prompt='Input resolution in terms of number of pixels desired along shortest length:';
res=input(prompt);%Required resolution=res
P=loadpcd('H:\Geometric Modelling\Project\tabletop_high_resolution\T-rex_high.pcd');
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
for i=1:totalcubes
    %defining the vertices of the cubes
    vertex1_x(i)=c1x;
    vertex1_y(i)=c1y;
    vertex1_z(i)=c1z;
    vertex2_x(i)=(c1x+cubelength);
    vertex2_y(i)=c1y;
    vertex2_z(i)=c1z;
    vertex3_x(i)=(c1x+cubelength);
    vertex3_y(i)=(c1y+cubelength);
    vertex3_z(i)=c1z;
    vertex4_x(i)=c1x;
    vertex4_y(i)=(c1y+cubelength);
    vertex4_z(i)=c1z;
    vertex5_x(i)=c1x;
    vertex5_y(i)=c1y;
    vertex5_z(i)=(c1z+cubelength);
    vertex6_x(i)=(c1x+cubelength);
    vertex6_y(i)=c1y;
    vertex6_z(i)=(c1z+cubelength);
    vertex7_x(i)=(c1x+cubelength);
    vertex7_y(i)=(c1y+cubelength);
    vertex7_z(i)=(c1z+cubelength);
    vertex8_x(i)=c1x;
    vertex8_y(i)=(c1y+cubelength);
    vertex8_z(i)=(c1z+cubelength);
    %checking intersection on each end
    for j=1:n
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex2_x(i)==P(1,j)%Test for possible failure
            if vertex2_z(i)==P(3,j)
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
        if vertex4_y(i)==P(2,j)%Test for possible failure
            if vertex4_z(i)==P(3,j)
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
        if vertex1_x(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_x(i)==P(1,j)
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
        if vertex2_y(i)==P(2,j)%Test for possible failure
            if vertex2_x(i)==P(1,j)
                if vertex2_z(i)<P(3,j)
                    if vertex6_z(i)>P(3,j)
                        edge6_x(i)=P(1,j);
                        edge6_y(i)=P(2,j);
                        edge6_z(i)=P(3,j);
                    end
                end
            end
        end
    end%done
    for j=1:n
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
        if vertex1_y(i)==P(2,j)%Test for possible failure
            if vertex1_z(i)==P(3,j)
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
    
end