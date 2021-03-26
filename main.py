dico = {
        "ocean" 	: 
        [
            {"type" : "food"  , "max_amount" : 10},
            {"type" : "wood"  , "max_amount" : 0},
            {"type" : "rocks" , "max_amount" : 0}
        ],
        "water" 	: 
        [
            {"type" : "food"  , "max_amount" : 5},
            {"type" : "wood"  , "max_amount" : 0},
            {"type" : "rocks" , "max_amount" : 0}
        ],
        "sand" 	: 
        [
            {"type" : "food"  , "max_amount" : 0},
            {"type" : "wood"  , "max_amount" : 3},
            {"type" : "rocks" , "max_amount" : 2}
        ]
    }


type = "sand"
available_res = []
if type in dico:
    for res in dico[type]:
        available_res.append({res["type"],res["max_amount"]})

def get_str_dic(dic_arr):
    for el in dic_arr:
        print(str(el))

