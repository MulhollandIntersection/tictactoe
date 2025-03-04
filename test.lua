local board = {
    a1 = ' ', a2 = ' ', a3 = ' ',
    b1 = ' ', b2 = ' ', b3 = ' ',
    c1 = ' ', c2 = ' ', c3 = ' '
}

function printBoard()
    print(board.a1 .. '|' .. board.a2 .. '|' .. board.a3)
    print('--+--+--')
    print(board.b1 .. '|' .. board.b2 .. '|' .. board.b3)
    print('--+--+--')
    print(board.c1 .. '|' .. board.c2 .. '|' .. board.c3)
end 

function updateBoard(position, marker)
    if board[position] == ' ' then
        board[position] = marker
        return true  
    else
        return false  
    end
end

function checkWin(marker)
    if (board.a1 == marker and board.a2 == marker and board.a3 == marker) or
       (board.b1 == marker and board.b2 == marker and board.b3 == marker) or
       (board.c1 == marker and board.c2 == marker and board.c3 == marker) then
           return true
    end

    if (board.a1 == marker and board.b1 == marker and board.c1 == marker) or
       (board.a2 == marker and board.b2 == marker and board.c2 == marker) or
       (board.a3 == marker and board.b3 == marker and board.c3 == marker) then
           return true
       end
   
    if (board.a1 == marker and board.b2 == marker and board.c3 == marker) or
       (board.a3 == marker and board.b2 == marker and board.c1 == marker) then
           return true
       end

    return false
end    

function reset() 
    board = {
        a1 = ' ', a2 = ' ', a3 = ' ',
        b1 = ' ', b2 = ' ', b3 = ' ',
        c1 = ' ', c2 = ' ', c3 = ' '
    }

    main()
end

function main() 
    print("Pick a row and column. Example: a1, b2, c3")
    printBoard()
    
    local currentPlayer = 'X'
    
    while true do
        print("Player " .. currentPlayer .. "'s Turn. Enter your position:")
        local userPos = io.read()
    
        if updateBoard(userPos, currentPlayer) then
            print("Updated Board:")
            printBoard()
            
            if checkWin(currentPlayer) then
                print("Player " .. currentPlayer .. " wins!")
                print("Do you want another game? Y or N")
                local yOrN = io.read()

                if (yOrN == 'Y' or yOrN == 'y') then
                    reset() 
                end
                break
            end
            
            if currentPlayer == 'X' then
                currentPlayer = 'O'
            else
                currentPlayer = 'X'
            end
        else
            print("Invalid position or position already taken. Try again.")
        end
    end
end    

main()