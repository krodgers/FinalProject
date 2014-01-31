% Kathryn Rodgers
% CS_277 Final Project


startdir = 'data/MillionSongSubset/data/';
top = dir(startdir);
%reader = HDF5_Song_File_Reader(file);
f = fopen('dataStuffs.txt','w');
for one = 'A':'Z'
    filename = [startdir filesep one];
    for two = 'A':'Z'
        for three = 'A':'Z'
            filename = [startdir filesep one filesep two filesep three];
            if exist(filename,'file')
                input = dir(filename);
                for x = 3:size(input)
                    fwrite(f,sprintf('%s\n',input(x).name));
                end
            end
        end
    end
end
fclose(f);


%% Just for funsies
% Plot Artist's locations
clf;
map = imread('worldmapL.png');
map(:,1:2) = flipud(map(:,1:2));
map(:,3) = flipud(map(:,3));
%grid on;
%image(map);
hold on;
imagesc(-180:180,-90:90,flipdim(map,1));axis xy;

axis equal

input = fopen('data/MillionSongSubset/AdditionalFiles/subset_artist_location.txt');
locals = textscan(input,'%s %f %f %s %s','delimiter','\t');
plot(locals{3}, locals{2},'b*','MarkerSize',6);
fclose(input);

saveas(gcf,'results/artistmap.png');

