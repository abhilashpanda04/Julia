### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 789cde0e-1cca-11eb-223a-db3cb8b31eb4
using ScikitLearn,CSV

# ╔═╡ 9405db50-1ccc-11eb-0da1-9f11e633595e
using DataFrame

# ╔═╡ 85c5dafe-1cca-11eb-1125-172809646a2f
iris=CSV.read("iris.csv",normalizenames = true)

# ╔═╡ 5503bfde-1ccb-11eb-1457-7dfec4d6f2c9
irisx=convert(Array,iris[:,[2,3,4,5]])

# ╔═╡ 0e80cbc0-1ccc-11eb-2a2b-c3d79b8c0901
irisy=convert(Array,iris[:,6 ])

# ╔═╡ 0e459780-1ccc-11eb-002e-fdf885f0e531
@sk_import linear_model: LogisticRegression

# ╔═╡ 0e13b210-1ccc-11eb-355e-9f822018ebfa
log_model=LogisticRegression()

# ╔═╡ 0ddf5ba0-1ccc-11eb-1865-311a7c9efe6b
fit!(log_model,irisx,irisy)

# ╔═╡ 0d7faf6e-1ccc-11eb-00bb-fdf937ae751d
pred=predict(log_model,irisx)

# ╔═╡ 0c544ed0-1ccc-11eb-105b-1f40d74aeef8
@sk_import metrics: accuracy_score

# ╔═╡ 4bac0ee2-1cce-11eb-0d99-e10e75478deb
accuracy=accuracy_score(pred,irisy)

# ╔═╡ 4b2be260-1cce-11eb-372b-ab759d571339
@sk_import tree: DecisionTreeClassifier

# ╔═╡ 4ac446f0-1cce-11eb-23ec-1954b326a03b
tree_model=DecisionTreeClassifier()

# ╔═╡ df5962f0-1cce-11eb-3ea8-4d949cb5a4c9
fit!(tree_model,irisx,irisy)

# ╔═╡ 03cd5b50-1ccf-11eb-36a5-8feb4ee8e021
pred_tree=predict(tree_model,irisx)

# ╔═╡ 1f444d30-1ccf-11eb-347f-2162546f5191
accuracy_tree=accuracy_score(pred_tree,irisy)

# ╔═╡ a113f5e0-1ccf-11eb-2b73-a14bc7e96b78
@sk_import ensemble: RandomForestClassifier

# ╔═╡ a22b8060-1ccf-11eb-1fbb-e3dbf16451b5
classifier= RandomForestClassifier()

# ╔═╡ f2f4ce70-1ccf-11eb-0f1c-bb668efe9776
fit!(classifier,irisx,irisy)

# ╔═╡ f447b440-1ccf-11eb-25a8-63de3676c5ea
pred_rand=predict(classifier,irisx)

# ╔═╡ f48c5e60-1ccf-11eb-34f1-6d7f78c8cc39
acc_class=accuracy_score(pred_rand,irisy)

# ╔═╡ f4cf33c0-1ccf-11eb-0ed9-75a4de8a52b2
@sk_import model_selection: train_test_split

# ╔═╡ e8fcf7c0-1cd0-11eb-3683-c97d67a108a8
x_train,x_test,y_train,y_test=train_test_split(irisx,irisy,test_size=0.6,random_state=1)

# ╔═╡ 4b8b91c0-1cd2-11eb-1442-45385ec9ac1e
#bulding logistic regression

# ╔═╡ e94a7b7e-1cd0-11eb-036c-c7f02a67af42
log_model2=LogisticRegression()

# ╔═╡ e98dc612-1cd0-11eb-1f1d-d5a9e431c719
fit!(log_model2,x_train,y_train)

# ╔═╡ e9ca32d0-1cd0-11eb-0a11-cf7ff3abf6f6
predict_log_model2=predict(log_model2,x_test)

# ╔═╡ c99b68c0-1cd1-11eb-31f4-252572ffd950
acc_log_model2=accuracy_score(predict_log_model2,y_test)

# ╔═╡ f1411910-1cd1-11eb-1524-3b3818a8360d


# ╔═╡ 674be8b0-1cd2-11eb-0aed-db13b800ae77
tree_2=DecisionTreeClassifier()

# ╔═╡ 6875c2b0-1cd2-11eb-0f9a-2fe05ed720a0
fit!(tree_2,x_train,y_train)

# ╔═╡ 90f11280-1cd2-11eb-00e6-3b81bb159c28
pred_tree_2=predict(tree_2,x_test)

# ╔═╡ a9d4fd70-1cd2-11eb-0964-bd9a4a24c8bc
acc_tree_2=accuracy_score(pred_tree_2,y_test)

# ╔═╡ bbfcd132-1cd2-11eb-27a2-43508d0428f0


# ╔═╡ bb9d9a30-1cd2-11eb-21b2-3d31bd19ddf0
rand_class=RandomForestClassifier()

# ╔═╡ bb2d9a50-1cd2-11eb-2558-3bf73869a9f7
fit!(rand_class,x_train,y_train)

# ╔═╡ c744bca0-1cd3-11eb-2c0b-29dc6cc22ee1
pred_rand_class=predict(rand_class,x_test)

# ╔═╡ dc8d5860-1cd3-11eb-21d9-dde8f17fa0ec
acc_rand_class2=accuracy_score(pred_rand_class,y_test)

# ╔═╡ ddb42520-1cd3-11eb-3d3d-717ccb706047
plot(x=acc_rand_class2,y=acc_tree_2,z=acc_log_model2)

# ╔═╡ Cell order:
# ╠═789cde0e-1cca-11eb-223a-db3cb8b31eb4
# ╠═85c5dafe-1cca-11eb-1125-172809646a2f
# ╠═5503bfde-1ccb-11eb-1457-7dfec4d6f2c9
# ╠═9405db50-1ccc-11eb-0da1-9f11e633595e
# ╠═0e80cbc0-1ccc-11eb-2a2b-c3d79b8c0901
# ╠═0e459780-1ccc-11eb-002e-fdf885f0e531
# ╠═0e13b210-1ccc-11eb-355e-9f822018ebfa
# ╠═0ddf5ba0-1ccc-11eb-1865-311a7c9efe6b
# ╠═0d7faf6e-1ccc-11eb-00bb-fdf937ae751d
# ╠═0c544ed0-1ccc-11eb-105b-1f40d74aeef8
# ╠═4bac0ee2-1cce-11eb-0d99-e10e75478deb
# ╠═4b2be260-1cce-11eb-372b-ab759d571339
# ╠═4ac446f0-1cce-11eb-23ec-1954b326a03b
# ╠═df5962f0-1cce-11eb-3ea8-4d949cb5a4c9
# ╠═03cd5b50-1ccf-11eb-36a5-8feb4ee8e021
# ╠═1f444d30-1ccf-11eb-347f-2162546f5191
# ╠═a113f5e0-1ccf-11eb-2b73-a14bc7e96b78
# ╠═a22b8060-1ccf-11eb-1fbb-e3dbf16451b5
# ╠═f2f4ce70-1ccf-11eb-0f1c-bb668efe9776
# ╠═f447b440-1ccf-11eb-25a8-63de3676c5ea
# ╠═f48c5e60-1ccf-11eb-34f1-6d7f78c8cc39
# ╠═f4cf33c0-1ccf-11eb-0ed9-75a4de8a52b2
# ╠═e8fcf7c0-1cd0-11eb-3683-c97d67a108a8
# ╠═4b8b91c0-1cd2-11eb-1442-45385ec9ac1e
# ╠═e94a7b7e-1cd0-11eb-036c-c7f02a67af42
# ╠═e98dc612-1cd0-11eb-1f1d-d5a9e431c719
# ╠═e9ca32d0-1cd0-11eb-0a11-cf7ff3abf6f6
# ╠═c99b68c0-1cd1-11eb-31f4-252572ffd950
# ╠═f1411910-1cd1-11eb-1524-3b3818a8360d
# ╠═674be8b0-1cd2-11eb-0aed-db13b800ae77
# ╠═6875c2b0-1cd2-11eb-0f9a-2fe05ed720a0
# ╠═90f11280-1cd2-11eb-00e6-3b81bb159c28
# ╠═a9d4fd70-1cd2-11eb-0964-bd9a4a24c8bc
# ╠═bbfcd132-1cd2-11eb-27a2-43508d0428f0
# ╠═bb9d9a30-1cd2-11eb-21b2-3d31bd19ddf0
# ╠═bb2d9a50-1cd2-11eb-2558-3bf73869a9f7
# ╠═c744bca0-1cd3-11eb-2c0b-29dc6cc22ee1
# ╠═dc8d5860-1cd3-11eb-21d9-dde8f17fa0ec
# ╠═ddb42520-1cd3-11eb-3d3d-717ccb706047
