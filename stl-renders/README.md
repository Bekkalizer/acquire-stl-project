
    $$$$$$\   $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$\ $$$$$$$\  $$$$$$$$\ 
    $$  __$$\ $$  __$$\ $$  __$$\ $$ |  $$ |\_$$  _|$$  __$$\ $$  _____|
    $$ /  $$ |$$ /  \__|$$ /  $$ |$$ |  $$ |  $$ |  $$ |  $$ |$$ |      
    $$$$$$$$ |$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$$$$$$  |$$$$$\    
    $$  __$$ |$$ |      $$ |  $$ |$$ |  $$ |  $$ |  $$  __$$< $$  __|   
    $$ |  $$ |$$ |  $$\ $$ $$\$$ |$$ |  $$ |  $$ |  $$ |  $$ |$$ |      
    $$ |  $$ |\$$$$$$  |\$$$$$$ / \$$$$$$  |$$$$$$\ $$ |  $$ |$$$$$$$$\ 
    \__|  \__| \______/  \___$$$\  \______/ \______|\__|  \__|\________|
                            \___|                                      
      
    Print and play - OpenScad project - by Bekkalizer and ChatGPT - GPLv3

# Guide to printing your own game
Poker chips and the [reduced $ reference sheet](https://boardgamegeek.com/filepage/263169/acquire-stockholder-info-sheet-reduced-dollar) from boardgame geek is the recommended non-printable components you would need. For everything else, print the game pieces by the instrctions below.

## Boards
**TLDR: Print all files in [board-9pcs](board-9pcs)**

Print one of the board versions below based on what printer size you have and how you want to proceed.
[board-9pcs](board-9pcs) contains the board rendered in 9 pieces, small enough for all 3p printers, with jigsaw interlocking pieces. **RECOMMENDED**
[board-4pcs](board-4pcs) contains the board rendered in 4 pieces, requiring a bigger 3p printer, with jigsaw interlocking pieces.
[board-full](board-full) contains a render of the whole board in one STL file. This file might be too big for most printers, but you might want to slice it yourself and glue it or otherwise attach it.

## Hotels
**TLDR: Print all hotel main buildings with teir corresponding price roofs and stock certificates with a matching color. Example: [HotelL.stl](hotels/HotelL.stl), [PriceRoofsLT.stl](hotels/PriceRoofsLT.stl) and 25 copies of [StockCertificateL.stl](stock-certificates/StockCertificateL.stl) in one color.**

The hotel itself is always needed. 

The price roofs are an optional addition that makes the price reference sheet obsolete and gives a visual clue to the hotel stock prices on the board itself. The price roofs show what the price is for various hotel sizes. If used, the price roofs should be printed with the same color as the hotel roof.

The stock certificate is an alternative to other cards, chips or any other way of tracking how many of the 25 stocks in each hotel chain owned by the players. If printing stock certificates, 25 certificates should be printed in the same color as the hotel itself.

This is the pairing of hotels and price roofs.
| Hotel name | Reference color | Hotel file | Price roof file | Stock certificate file |
|------------|-----------------|------------|-----------------|------------------------|
| Luxor(Sackson) | Red | [HotelL.stl](hotels/HotelL.stl) | [PriceRoofsLT.stl](hotels/PriceRoofsLT.stl) | [StockCertificateL.stl](stock-certificates/StockCertificateL.stl) |
| Tower | Yellow | [HotelT.stl](hotels/HotelT.stl) | [PriceRoofsLT.stl](hotels/PriceRoofsLT.stl) | Coming soon |
| American | Dark blue | [HotelA.stl](hotels/HotelA.stl) | [PriceRoofsAFW.stl](hotels/PriceRoofsAFW.stl) | Coming soon |
| Festival | Green | [HotelF.stl](hotels/HotelF.stl) | [PriceRoofsAFW.stl](hotels/PriceRoofsAFW.stl) | Coming soon |
| Worldwide | Purple | [HotelW.stl](hotels/HotelW.stl) | [PriceRoofsAFW.stl](hotels/PriceRoofsAFW.stl) | Coming soon |
| Continental | Light blue | [HotelC.stl](hotels/HotelC.stl) | [PriceRoofsCI.stl](hotels/PriceRoofsCI.stl) | [StockCertificateC.stl](stock-certificates/StockCertificateC.stl) |
| Imperial | Orange | [HotelI.stl](hotels/HotelI.stl) | [PriceRoofsCI.stl](hotels/PriceRoofsCI.stl) | [StockCertificateI.stl](stock-certificates/StockCertificateI.stl) |

The color can naturally be anything you like as long as all components for one hotel match - and you can create a reference sheet with your own colors.
