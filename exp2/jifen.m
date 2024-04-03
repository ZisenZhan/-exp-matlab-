% 定义符号变量和函数
syms x;

% 定义分段函数
f = piecewise(x ~= 1, x + sqrt(1 - x), x == 1, 1);

% 计算导数
df = diff(f, x);

% 找到导数为零的点
solutions = solve(df == 0, x);

% 确保解在定义域内
valid_solutions = solutions(solutions >= 0 & solutions <= 1);

% 计算函数和导数的值
x_values = linspace(0, 1, 1000);
y_values_f = double(subs(f, x, x_values));
y_values_df = double(subs(df, x, x_values));

% 画图
figure;
subplot(2, 1, 1);
plot(x_values, y_values_f, 'LineWidth', 2);
hold on;
scatter(valid_solutions, double(subs(f, x, valid_solutions)), 'r', 'filled');
title('分段函数 f(x)');
xlabel('x');
ylabel('f(x)');
legend('f(x)', '极值点');

subplot(2, 1, 2);
plot(x_values, y_values_df, 'LineWidth', 2);
title('导数 f''(x)');
xlabel('x');
ylabel('f''(x)');

hold off;
