import unittest
from src.node import Node


class TestNode(unittest.TestCase):
    def setUp(self) -> None:
        self.none_node = Node()

    def test_none_node_name(self):
        self.assertEqual(self.none_node.name, 'none')

# //TODO: TVP-27: Добавить тестирование функционала узла


if __name__ == '__main__':
    unittest.main()
