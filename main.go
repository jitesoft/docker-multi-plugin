package main

import (
	"github.com/docker/cli/cli-plugins/manager"
	"github.com/docker/cli/cli-plugins/plugin"
	"github.com/docker/cli/cli/command"
	"github.com/docker/docker/api/types"
	"github.com/spf13/cobra"

	log "github.com/sirupsen/logrus"

	"context"
)

var MultiVersion string

func main() {
	plugin.Run(func(dockerCli command.Cli) *cobra.Command {
		tag := &cobra.Command{
			Use:     "tag",
			Args:    cobra.MinimumNArgs(2),
			Short:   "Tag a source image with multiple extra tags.",
			Example: "docker multi tag origin:tag target:tag target2:tag2 target3:tag",
			Run: func(cmd *cobra.Command, args []string) {
				origin := args[0]
				for i := 1; i < len(args); i++ {
					target := args[i]

					err := dockerCli.Client().ImageTag(context.TODO(), origin, target)
					if err != nil {
						log.Error("Failed to assign " + origin + " with the tag " + target)
					} else {
						log.Info("Tag " + target + " created from " + origin)
					}
				}
			},
		}

		push := &cobra.Command{
			Use:     "push",
			Args:    cobra.MinimumNArgs(2),
			Short:   "Push multiple images in one command.",
			Example: "docker multi push image:tag image:tag2 image:tag3",
			Run: func(cmd *cobra.Command, args []string) {
				for i := 1; i < len(args); i++ {
					target := args[i]
					_, err := dockerCli.Client().ImagePush(context.TODO(), target, types.ImagePushOptions{})
					if err != nil {
						log.Error("Failed to push image " + target)
					} else {
						log.Info("Pushed image with tag " + target + " successfully")
					}
				}
			},
		}

		cmd := &cobra.Command{
			Use:   "multi",
			Short: "Batch-run commands.",
			RunE: func(cmd *cobra.Command, args []string) error {
				return nil
			},
		}

		cmd.AddCommand(tag, push)
		return cmd
	}, manager.Metadata{
		ShortDescription: "Docker CLI Plugin to allow for batch commands.",
		SchemaVersion:    "0.1.0",
		Vendor:           "Jitesoft",
		Version:          MultiVersion,
	})
}
