import pandas as pd


def generic_load(path, target="is_fake"):
    df = pd.read_csv(path)
    return {"data": df.drop([target], axis=1), "target": df[target]}


def load_instafake():
    return generic_load("./data/fake-v1.0.csv")


def load_instafinal():
    return generic_load("./data/final-v1.csv")

def load_instaauto():
    data=generic_load("./data/automated-v1.0.csv", target="automated_behaviour")
    data['data']=data['data'].drop(data['data'].iloc[:, 1:7].columns, axis=1)
    return data
