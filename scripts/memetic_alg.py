import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import f1_score
from sklearn.svm import SVC
from utils import load_instafinal

df = load_instafinal()

scalar = StandardScaler()
df['data'] = scalar.fit_transform(df['data'])

X_train, X_test, y_train, y_test = train_test_split(df['data'], df['target'], test_size=0.33, random_state=42)

def objective(x):
    if np.sum(x) == 0:
        return 0

    clf = SVC()
    features = X_train[:,x==1]
    print('Selected Features')
    print(features)
    clf.fit(features,y_train)
    y_pred = clf.predict(X_test[:,x==1])
    return f1_score(y_test, y_pred)


if __name__ == '__main__':
    n_features = X_train.shape[1]

    # randomly generate a list of ten numbers between 0 and 1
    x = np.random.randint(0,2,n_features)
    xp = np.full(n_features, 1)

    print('N-Features:', n_features)

    print('Shape:')
    print(X_train.shape)

    print('Selected Features N List:')
    print(x)
    print(xp)

    # print the result of the objective function
    print('Rand Result:')
    print(objective(x))

    print('All Features Result:')
    print(objective(xp))
