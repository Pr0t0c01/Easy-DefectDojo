file_names = ["dc-build.sh", "dc-down.sh", "dc-stop.sh", "dc-unittest.sh", "dc-up-d.sh", "dc-up.sh", "docker/docker-compose-check.sh", "docker/entrypoint-initializer.sh", "docker/setEnv.sh"]


for name in file_names:
    # Read the file content
    with open(name, 'r') as file:
        lines = file.readlines()

    # Replace text in each line
    new_lines = [line.replace("docker compose", "docker-compose") for line in lines]

    # Write the modified content back to the file
    with open(name, 'w') as file:
        file.writelines(new_lines)
