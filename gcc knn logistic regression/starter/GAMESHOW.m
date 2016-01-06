function  result = GAMESHOW(M)
    %init the price
    price = randi([0 M],1);
    %player pick a door
    player_p = randi([0 M],1);
    result = 1;
    %Since all the doors are going to be open except two doors including 
    %the price and player are going to switch all the time. The only chance
    %of lossing loses is player pick the correct price at the first time 
    if player_p == price
        result = 0;
    end
end