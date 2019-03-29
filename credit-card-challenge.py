import re
import itertools 
REGEX = r'^([456][0-9]{3})-?([0-9]{4})-?([0-9]{4})-?([0-9]{4})$'

def quadwise(iterable):
    a, b, c, d = itertools.tee(iterable, 4)
    next(b, None)
    next(c, None)
    next(c, None)
    next(d, None)
    next(d, None)
    next(d, None)
    return zip(a, b, c, d)

def val_rep(num):
    return not any(
        all(head == item for item in (a, b, c))
        for head, a, b, c in quadwise(num)
    )

def valid_creditcard(card):
    groups = re.match(REGEX, card)
    if not groups:
        return False
    if card.count('-') not in (0, 3):
        return False
    return val_rep(''.join(groups.groups()))

if __name__ == '__main__':
    total_count = int(input())
    cards = [
        input()
        for count in range(total_count)
    ]

    for card in cards:
        if valid_creditcard(card):
            print('Valid')
        else:
            print('Invalid')
