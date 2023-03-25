# исходные данные
data = [(1, 12345, 89997776655, 'test@mail.ru'),
        (2, 54321, 87778885566, 'two@mail.ru'),
        (3, 98765, 87776664577, 'three@mail.ru'),
        (4, 66678, 87778885566, 'four@mail.ru'),
        (5, 34567, 84547895566, 'four@mail.ru'),
        (6, 34567, 89087545678, 'five@mail.ru')]


# функция поиска
def searching_data(c, v):
    # пустой словарь связанных данных
    value_dict = {'id': set(), 'phone': set(), 'mail': set()}
    # добавление введенного значения в словарь связанных данных
    value_dict[c].add(v)
    # множество индексов найденных связанных строк
    idx = set()
    flag = -1
    while flag != len(idx):
        flag = len(idx)
        # перебор строк датасета, еще не отобранных в результат
        for i in set(range(len(data))).difference(idx):
            if str(data[i][1]) in value_dict['id']\
                    or str(data[i][2]) in value_dict['phone']\
                    or data[i][3] in value_dict['mail']:
                value_dict['id'].add(str(data[i][1]))
                value_dict['phone'].add(str(data[i][2]))
                value_dict['mail'].add(str(data[i][3]))
                idx.add(i)
    [print(*data[i]) for i in sorted(idx)]


c = input('Укажите, по какому полю будет производиться поиск (id, phone, mail): ')
v = input('Введите значение для поиска: ')
searching_data(c, v)

#searching_data('phone', '87778885566')
