# this is a fake external app to run tools on


def some_weird_func():
    print('foo')


def CamelCased():
    print('this is not ok')

    try:
        raise Exception( 'kaboem')
    except:
        pass
