defmodule Nodes.Example do
  # Создаем три ноды iex --sname node1 (node1 - node3)

  # Коннектимся через Node.connect()
  # Проверяем вывод с текущей нодой + все видимые
  Node.list([:this, :visible])
  # Пробуем примитив порождения процесса на другой ноде
  Node.spawn(:node2@doyal, fn -> IO.puts("Hi, I am node #{node()}") end)
  # Вывод - вывод операций ввода-вывода стекается к порождающему (главному) потоку
  # PID<17579.125.0>
  # Hi, I am node node2@doyal

  # Ноды можно мониторить - Process.monitor()

  # Вызываем функцию на другой ноде, получаем результат у себя в вызывающем процессе
  :rpc.call(:node3@doyal, Nodes, :reverse, [[12, 2, 23, 4, 6, 22, 17, 100, 11]])
  # [11, 100, 17, 22, 6, 4, 23, 2, 12]
end
