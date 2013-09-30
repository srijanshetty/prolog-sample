True `and'` x 
    | x == True = True
    | x == False = False

False `and'` x
    | x == False = False
    | x == True = False
