

export const sortList = (items: any[], selectedSort: string, setSortedItems: (arg0: any[]) => void) => {
    const sorted = [...items].sort((a, b) => {
        switch (selectedSort) {
            case 'Все':
                if (a.id && b.id) {
                    return a.id - b.id;
                }
                break;
            case 'По алфавиту':
                if (a.name && b.name) {
                    const nameA = a.name.toLowerCase();
                    const nameB = b.name.toLowerCase();
                    return nameA.localeCompare(nameB);
                }
                break;
            case 'Популярные':
                if (a.listens === 0 && b.listens === 0) {
                    return 0;
                } else if (a.listens === 0) {
                    return 1;
                } else if (b.listens === 0) {
                    return -1;
                } else {
                    return b.listens - a.listens;
                }
                break;
            default:
                // Возвращаем исходный массив в случае недопустимого значения selectedSort
                return items;
        }
    });
    setSortedItems(sorted);
};