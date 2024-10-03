import React from "react"
import Button from "./button"
import clsx from "clsx"
import { slugify } from "@/utils/slugify"

type Props = {
    btnText: string
    className?: string
    description: string
    jumpTo: string
}

export default function Pointer({
    btnText,
    className,
    description,
    jumpTo
}: Props) {
    return (
        <div className="flex flex-col min-w-[230px] gap-y-2 text-center md:flex-col-reverse">
            <Button
                href={`${jumpTo}`}
                className={clsx("w-full px-3", className)}
                data-umami-event={`hero-section-cta-${slugify(btnText)}`}
            >
                {btnText}
            </Button>
            {!!description && (
                <p className="text-sm font-medium">{description}</p>
            )}
        </div>
    )
}
